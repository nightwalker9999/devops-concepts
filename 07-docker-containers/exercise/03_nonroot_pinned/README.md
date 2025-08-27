### Docker Task — Run as non-root + pin base image (folder: 03_nonroot_pinned)

#### 1. Create Dirs 

#### 2. (Reproducibility) Get the current digest for python:3.12-slim:
```bash
docker pull python:3.12-slim
docker inspect --format='{{index .RepoDigests 0}}' python:3.12-slim
# Copy the whole value like: python:3.12-slim@sha256:XXXXXXXX...
```

#### 3. Create .dockerignore:
```bash
__pycache__/
*.pyc
*.log
.venv/
venv/
.git/
```

#### 4. Create Dockerfile (fill in the digest you copied in BOTH FROM lines):
```bash
# --- builder ---
FROM python:3.12-slim@sha256:<PUT_DIGEST_HERE> AS builder
WORKDIR /app
COPY requirements.txt .
RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential \
 && pip install --prefix=/install --no-cache-dir -r requirements.txt \
 && rm -rf /var/lib/apt/lists/*

# --- runtime (non-root) ---
FROM python:3.12-slim@sha256:<PUT_DIGEST_HERE>
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app

# least-privilege user
RUN groupadd -g 10001 app && useradd -r -u 10001 -g app app

# bring in deps and code
COPY --from=builder /install /usr/local
COPY . .

# ownership + drop root
RUN chown -R app:app /app
USER app

EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD python -c "import urllib.request as u; u.urlopen('http://localhost:5000/health').read()" || exit 1

CMD ["python", "app.py"]
```

#### 5. Build & run, then prove it’s non-root and healthy:
```bash
docker build -t flask-nonroot:today .
docker run --rm -d --name flask-nonroot -p 5000:5000 flask-nonroot:today
docker exec -it flask-nonroot id
# expect: uid=10001(app) gid=10001(app) groups=10001(app)

curl -sf http://localhost:5000/health && echo
curl -sf http://localhost:5000/ && echo
```