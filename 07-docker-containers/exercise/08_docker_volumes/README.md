
## 🐳 Docker Volumes – Bind Mount vs Named Volume

This exercise demonstrates how to persist data in Docker containers using **named volumes** (managed by Docker) and **bind mounts** (host directories mapped into containers).

---

### 📌 Named Volume Demo

1. **Create a named volume and run a container that writes logs:**
   ```bash
   docker volume create mylogs

   docker run -d --name logger \
     -v mylogs:/var/log/app \
     alpine sh -c "while true; do date >> /var/log/app/timestamps.log; sleep 5; done"


2. **Inspect the volume and logs:**

   ```bash
   docker volume ls
   docker volume inspect mylogs
   docker exec -it logger tail -n 5 /var/log/app/timestamps.log
   ```

3. **Remove container, reattach volume in a new container, and check logs:**

   ```bash
   docker rm -f logger
   docker run --rm -v mylogs:/var/log/app alpine cat /var/log/app/timestamps.log
   ```

✅ **Observation:** Log entries persisted even after the original container was removed.
👉 **Lesson:** Named volumes are managed by Docker (`/var/lib/docker/volumes/...`) and data survives container lifecycle.

---

## 📌 Bind Mount Demo

1. **Create a host directory and run container with a bind mount:**

   ```bash
   mkdir -p ./hostlogs

   docker run -d --name bindlogger \
     -v $(pwd)/hostlogs:/var/log/app \
     alpine sh -c "while true; do echo hello >> /var/log/app/hello.log; sleep 5; done"
   ```

2. **Check logs directly on host:**

   ```bash
   tail -n 5 ./hostlogs/hello.log
   ```

3. **Remove container:**

   ```bash
   docker rm -f bindlogger
   ```

✅ **Observation:** File `hello.log` remains on host after container removal.
👉 **Lesson:** Bind mounts map a **host directory** into a container. Great for development when you want host ↔ container file sharing.

---

## 📒 Summary

* **Named Volume:**

  * Managed entirely by Docker.
  * Portable, safer for production.
  * Good for databases (MySQL/Postgres persistent storage).

* **Bind Mount:**

  * Directly links host path.
  * Gives full visibility & control.
  * Useful for development (live code sync, host log access).

---

## 🎯 Interview Hooks

* **Q:** How do you persist data in Docker?
  **A:** By using volumes (named or bind mounts).

* **Q:** Difference between named volume & bind mount?
  **A:** Named volumes are Docker-managed (portable, abstracted); bind mounts map a host folder (more control, less portable).

* **Q:** What happens if you delete a container that used a volume?
  **A:** Data remains in the volume or host directory, not tied to the container lifecycle.


