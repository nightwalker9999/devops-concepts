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
