
## 🐳 Docker Best Practices

This exercise summarizes Docker **best practices** and closes the Docker learning block (Days 8–14).

---

### ✅ Checklist of Best Practices

* **Use slim/alpine bases** → smaller, safer images.
* **Combine `RUN` steps** → fewer layers.
* **Clean apt cache** → `rm -rf /var/lib/apt/lists/*`.
* **Pin dependency versions** → use `requirements.txt`.
* **Use `.dockerignore`** → exclude `.git`, cache files, secrets.
* **Don’t run as root** → use `USER appuser`.
* **Multistage builds** → separate build deps from runtime.
* **Use volumes for persistence** → bind vs named volumes.
* **Compose for multi-service orchestration**.
* **Add healthchecks** → ensure container readiness.

---

### 🔑 Interview Q\&A Reference

**1. CMD vs ENTRYPOINT**

* CMD = default command, override easy.
* ENTRYPOINT = main process, harder to override.

**2. Why docker-compose?**

* Single YAML for multi-container apps, service deps, shared networks.

**3. Bridge vs Host networking**

* Bridge = isolated network, DNS by service name.
* Host = uses host network stack, less isolation.

**4. Bind vs Named volumes**

* Bind = host path mapped, tied to machine.
* Named = Docker-managed, portable.

**5. Persisting data**

* Use volumes (not container FS).

**6. Reducing image size**

* Slim base, multistage builds, combine RUN, clean cache, `.dockerignore`.

**7. Why multistage builds?**

* Keep build tools out of runtime → smaller, safer images.

**8. What if no `.dockerignore`?**

* Context becomes huge, slows build, bloats image.

**9. Debugging containers**

* `docker logs <id>` → check logs.
* `docker exec -it <id> sh` → get shell inside container.

**10. Best practice for production**

* Run as non-root, add healthchecks, keep minimal image size.

---

### 📌 Reflection (Day 14 — Docker 101 in My Words)

* **Problem solved by Docker**: consistency, isolation, remove manual setup errors.
* **Image vs Container**: blueprint vs running instance.
* **Dockerfile / Compose**: build recipes vs orchestration.
* **Optimization results**: Fat 1.13GB → Slim 133MB → Multi 124MB.
* **Confident areas**: image optimization, volumes, compose basics.

---

### 🚀 Status

✔️ **Docker Block Completed (Days 1–14)**
Next Block → **Terraform Fundamentals**

