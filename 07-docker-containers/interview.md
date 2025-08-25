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

## 🎤 Interview Qs 
Polished Q/A — Day 1 (Exercise 01) 

#### Q1. Why use python:3.10-slim instead of python:3.10?

 A: Slim is a lightweight base image that saves hundreds of MBs, pulls faster, and reduces attack surface. Tradeoff: you may need to install extra dependencies manually.

#### Q2. Why place COPY requirements.txt . before copying source code?

A: It optimizes Docker layer caching — if dependencies don’t change, the pip install layer is reused even when app code changes, which speeds up builds.

#### Q3. Why is .dockerignore important?

A: It excludes unnecessary files (like .git, logs, caches) from the build context, resulting in faster builds, smaller images, and less risk of leaking sensitive files.

#### Q4. Difference between CMD and ENTRYPOINT?

A:

CMD: sets default command/args, easily overridden at runtime.

ENTRYPOINT: defines the main executable, harder to override.
👉 Often combined (ENTRYPOINT for executable, CMD for defaults).

#### Q5. What happens if you add multiple RUN instructions?

A: Each RUN creates a new image layer → bigger image and slower builds. Best practice is to minimize RUNs or combine related commands with && to reduce layers.
