# Build -> Runtime -> HealthCheck -> Cmd (BRHC - Mnemonic)

# Build
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
    && pip install --prefix=/install -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*
    

# Runtime
FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app
COPY --from=builder /install /usr/local
COPY . .
EXPOSE 5000

# HealthCheck
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD python -c "import urllib.request as u; u.urlopen('http://localhost:5000/health').read()" || exit 1

# Cmd
CMD ["python", "app.py"]