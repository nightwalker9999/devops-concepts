## 📄 README.md — Docker Image Optimization (Slim Base & Multistage)

> Folder: `07-docker-containers/exercise/09_optimize_docker_images`

### Overview

We optimized a trivial Python app image in three ways and compared sizes:

* **Fat base** (`python:3.12`)
* **Slim base** (`python:3.12-slim`)
* **Multistage** (builder → runtime)

### Results (from my run)

```
myapp:fat    → 1.13GB
myapp:slim   → 133MB
myapp:multi  → 124MB
```

### Files

```
app.py
requirements.txt                # flask==3.0.0
Dockerfile.fat                  # fat base
Dockerfile.slim                 # slim base
Dockerfile.multi                # multistage
README.md
```

#### `app.py`

```python
print("Hello from Docker optimization demo!")
```

#### `requirements.txt`

```txt
flask==3.0.0
```

---

### A) Fat vs Slim

#### Dockerfile (fat) — `Dockerfile.fat`

```dockerfile
FROM python:3.12
WORKDIR /app
COPY app.py .
RUN apt-get update && apt-get install -y curl
CMD ["python", "app.py"]
```

#### Dockerfile (slim) — `Dockerfile.slim`

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY app.py .
RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*
CMD ["python", "app.py"]
```

#### Build & compare

```bash
# Fat
docker build -f Dockerfile.fat -t myapp:fat .
docker images myapp:fat

# Slim
docker build -f Dockerfile.slim -t myapp:slim .
docker images myapp:slim

# Quick comparison
docker images | grep myapp
```

**Observed:** `1.13GB → 133MB` by switching to `python:3.12-slim` and cleaning apt caches.

---

### B) Multistage (builder → runtime)

#### Dockerfile — `Dockerfile.multi`

```dockerfile
# ---- Builder ----
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---- Final ----
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY app.py .
EXPOSE 8000
CMD ["python", "app.py"]
```

#### Build & run

```bash
docker build -f Dockerfile.multi -t myapp:multi .

# Note: 8080 might already be in use in Gitpod → use 8686 instead
docker run --rm -p 8686:8000 myapp:multi
# open http://localhost:8686
```

#### Why it works

* Builder installs deps to `/install`.
* Final image copies only `/install` → `/usr/local` (on Python’s default PATH/sys.path).
* No build tools leak into runtime → **smaller, cleaner** final image.

#### Inspect (optional)

```bash
# Tag & inspect builder stage
docker build -f Dockerfile.multi --target builder -t myapp:builder .
docker run -it --rm myapp:builder sh -lc 'ls -R /install | sed -n "1,120p"'

# Inspect final stage for site-packages
docker run -it --rm myapp:multi sh -lc '
  find /usr/local -maxdepth 3 -type d -name "*site-packages*" -print;
  python - <<PY
import sys, flask
print("flask file:", flask.__file__)
print("sys.path has /usr/local?", any("/usr/local" in p for p in sys.path))
PY'
```

#### Layer history (optional)

```bash
docker history myapp:multi
# Look for a small COPY layer from /install → /usr/local (a few MB)
```

---

#### .dockerignore (recommended)

```
__pycache__/
*.pyc
.git
.gitignore
.env
```

---

### Interview Hooks

* **How to reduce Docker image size?**
  Use smaller base images (slim/alpine), combine `RUN` steps, clean caches, and **multistage builds** to keep build deps out of runtime.

* **Why multistage?**
  Separate build-time deps from runtime to shrink the final image and surface area.

* **Caching tip?**
  Copy `requirements.txt` and install **before** copying app code to leverage layer caching.

