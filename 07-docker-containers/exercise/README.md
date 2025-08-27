## Docker - 02 Multistage Build

```bash
Multi-stage builds → You built an app with a builder stage (install deps) and runtime stage (copy only what’s needed).
✅ Learned: Image layering, smaller optimized image.

.dockerignore → excluded junk like venv, __pycache__, logs → reduced build context.

Healthcheck → added HEALTHCHECK in Dockerfile + tested with curl.

App Run → container ran successfully (Hello from multi-stage Docker build!, /health returned {"status": "ok"}).
```

### What did I do?


A. I containerized a Flask app with a multi-stage Dockerfile: builder stage installs deps, runtime stage copies only what’s needed.
I added a healthcheck and used a .dockerignore to speed builds and reduce context.

Then I automated it in Jenkins: Checkout → Build → Smoke Test → Tag & Push to GHCR.

I parameterized the pipeline for flexible tagging and archived logs as artifacts for debugging.

### The flow

#### What lands where? (Docker COPY map)
```bash
HOST (build context = 02_multistage_dockerfile/)
├── app.py
├── requirements.txt
├── Dockerfile
└── .dockerignore    -> (excludes junk like __pycache__/, .git/, *.log, etc.)
```
#### 1) Builder stage
```bash
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --prefix=/install --no-cache-dir -r requirements.txt
```
##### After this stage builds:
```bash
builder image filesystem
/
├── app/
│   └── requirements.txt        (from COPY requirements.txt .)
└── /install/...                (pip-installed site-packages here)
```
Only requirements.txt is copied into /app.

pip install --prefix=/install places packages under /install (not in /app).

#### 2) Runtime stage
```bash
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
```

##### After these lines:
```bash
runtime image filesystem
/
├── usr/local/...               (copied from builder’s /install → runtime’s /usr/local)
└── app/                        (WORKDIR)
    ├── app.py                  (from host via COPY . .)
    ├── requirements.txt        (from host via COPY . .)
    └── (nothing ignored by .dockerignore is present)
```
### Key meanings

COPY . .
→ source = “everything in the build context (here), after .dockerignore filtering”
→ destination = current directory inside the image = /app (because of WORKDIR /app)

COPY --from=builder /install /usr/local
→ copy only artifacts from the builder stage (here: installed packages) into the runtime image.
→ This is not affected by your host .dockerignore (it’s image-to-image copy).

### Put together flow
```bash
[Host folder] --(COPY requirements.txt)--> [Builder:/app]
      │
      └─ pip install --prefix=/install
                          │
                          └── [Builder:/install/** site-packages **]
                                   │
[Runtime] <-- COPY --from=builder /install → /usr/local
      │
      └─ COPY . .   (app.py, requirements.txt → /app)
```

#### What happens without .dockerignore?
→ Docker sends the entire directory (source, git history, venv, logs) to the daemon. Slow, insecure.

#### What does .dockerignore do?
→ Works like .gitignore: excludes unnecessary files, reduces build context, improves speed & security.

#### Key line to remember:

“Smaller build context = faster builds, fewer cache invalidations, and no leaking secrets.”