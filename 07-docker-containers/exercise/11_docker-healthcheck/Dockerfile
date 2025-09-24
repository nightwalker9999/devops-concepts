FROM python:3.12-slim AS base
RUN useradd -m appuser
WORKDIR /app
COPY app.py .
RUN pip install --no-cache-dir flask

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

HEALTHCHECK --interval=5s --timeout=2s --retries=3 CMD curl -fsS http://127.0.0.1:8080/healthz || exit 1

USER appuser
EXPOSE 8081
CMD ["python","app.py"]