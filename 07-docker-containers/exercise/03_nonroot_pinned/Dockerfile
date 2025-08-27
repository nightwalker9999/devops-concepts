# Builder

FROM python@sha256:d67a7b66b989ad6b6d6b10d428dcc5e0bfc3e5f88906e67d490c4d3daac57047 as builder
WORKDIR /app
COPY requirements.txt .
RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential \
 && pip install --prefix=/install --no-cache-dir -r requirements.txt \
 && rm -rf /var/lib/apt/lists/*

# --- runtime (non-root) ---
FROM python@sha256:d67a7b66b989ad6b6d6b10d428dcc5e0bfc3e5f88906e67d490c4d3daac57047
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

# Healthcheck
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD python -c "import urllib.request as u; u.urlopen('http://localhost:5000/health').read()" || exit 1

# cmd
CMD ["python", "app.py"]

