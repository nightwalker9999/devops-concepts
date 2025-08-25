| Q                                                       | A (1–2 lines)                                                                                                                                                | Cmd / Example                                                        |                        |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------- | ---------------------- |
| Why use `python:3.10-slim` over `python:3.10`?          | Slim is much smaller (faster pulls, smaller attack surface). May need to add missing OS libs when required.                                                  | `FROM python:3.10-slim`                                              |                        |
| What does `WORKDIR /app` do?                            | Sets default working directory; subsequent `COPY`, `RUN`, `CMD` execute from `/app`.                                                                         | `WORKDIR /app`                                                       |                        |
| `COPY requirements.txt .` placed before app code — why? | Optimizes Docker layer cache: if deps don’t change, `pip install` layer is reused even when source code changes.                                             | `COPY requirements.txt .` then `RUN pip install -r requirements.txt` |                        |
| `ADD` vs `COPY`?                                        | Prefer `COPY` for simple file copy. `ADD` can auto‑extract tar/URL; more implicit behavior → use sparingly.                                                  | `COPY . .`                                                           |                        |
| Why `--no-cache-dir` in `pip install`?                  | Prevents pip from storing wheels/cache → reduces final image size.                                                                                           | `RUN pip install --no-cache-dir -r requirements.txt`                 |                        |
| Why have a `.dockerignore`?                             | Excludes unneeded files from build context (e.g., `.git`, logs) → faster builds, smaller images.                                                             | `.dockerignore` with `.git`, `__pycache__/`, `*.log`                 |                        |
| `CMD` vs `ENTRYPOINT`?                                  | `CMD` sets default args/command (easy to override). `ENTRYPOINT` defines the main executable (harder to override). Often combine: ENTRYPOINT + CMD defaults. | `CMD ["python","app.py"]`                                            |                        |
| How do Docker layers & caching work (high level)?       | Each instruction creates a layer; unchanged instructions reuse cached layers → big speedups if order is optimized.                                           | Observe “Using cache” during `docker build`                          |                        |
| How to measure image size & verify build?               | Use `docker images` or `docker image inspect`.                                                                                                               | `docker build -t docker-baseline:1 .` then \`docker images           | grep docker-baseline\` |

## 🎤 Interview Qs (for today’s notes in `interview.md`)
1. What happens when you add multiple `RUN` instructions in Dockerfile?  
A: Each RUN creates a new image layer. More RUNs = more layers, which can bloat the image and slow builds. Best practice: combine related commands into one RUN with && to reduce layers.

2. Difference between `ADD` and `COPY` in Dockerfile?  
A: COPY → simple, predictable file copy from host → container.

    ADD → can also fetch remote URLs or auto-extract tar files.
    👉 Best practice: use COPY for clarity; use ADD only when you specifically need its extra features.

3. Why is `.dockerignore` important?  
A: It excludes unnecessary files (like .git/, logs, caches) from the build context. This reduces image size, speeds up builds, and avoids leaking sensitive files inside the container.
