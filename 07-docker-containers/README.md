## 🐳 Docker Learning Track — Exercises

This directory contains my hands-on Docker learning journey, covering fundamentals to best practices.
Each subfolder has its own `README.md` with commands, notes, and interview Q\&A.

---

### 📂 Exercises

1. **[01\_baseline\_dockerfile](./01_baseline_dockerfile/)**

   * Basic Dockerfile instructions: `FROM`, `RUN`, `COPY`, `CMD`, `ENTRYPOINT`.
   * Layering & reusability.

2. **[02\_multistage\_dockerfile](./02_multistage_dockerfile/)**

   * Multistage builds to shrink images.
   * Separation of build vs runtime.

3. **[03\_nonroot\_pinned](./03_nonroot_pinned/)**

   * Running containers as non-root for security.
   * Pinning base images for reproducibility.

4. **[04\_docker-compose-lab](./04_docker-compose-lab/)**

   * Intro to `docker-compose.yml`.
   * Multi-service app (web + db) with service dependencies.

5. **[05\_docker\_networking](./05_docker_networking/)**

   * Networking modes: **bridge vs host**.
   * Service-to-service communication by container name.

6. **[08\_docker\_volumes](./08_docker_volumes/)**

   * Bind mounts vs named volumes.
   * Persisting logs/data outside the container lifecycle.

7. **[09\_optimize\_docker\_images](./09_optimize_docker_images/)**

   * Image optimization strategies:

     * Fat base (1.13GB) → Slim base (133MB) → Multistage (124MB).
   * Layer caching & cleanup for smaller, safer images.

8. **[10\_docker\_best\_practices](./10_docker_best_practices/)**

   * Wrap-up of best practices & interview prep.
   * Reflection: *“Docker 101 in my own words.”*

---

### 🧾 Status

✔️ **Docker Block Complete (Exercises 01–10)**
Next Block → **Terraform Fundamentals**

