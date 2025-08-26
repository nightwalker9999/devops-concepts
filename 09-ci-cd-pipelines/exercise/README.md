# Spin Jenkins (Docker). New Flask app for docker-flask-opt

```bash
# Create a network (optional but tidy)
docker network create ci-net || true

# Create persistent volumes
docker volume create jenkins_home
docker volume create jenkins_docker_certs

# Run Jenkins LTS with docker access
docker run -d --name jenkins \
  --restart unless-stopped \
  --user root \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e JENKINS_OPTS="--argumentsRealm.passwd.admin=admin --argumentsRealm.roles.admin=admin" \
  -e JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
  jenkins/jenkins:lts
```

Grab the initial admin password:

```bash
docker exec -it jenkins bash -lc 'cat /var/jenkins_home/secrets/initialAdminPassword'
```

Then open http://localhost:8080, finish setup, and install plugins:


    Pipeline
    Git
    Docker Pipeline


Perfect approach 👍 — quick recap first, then build.
Here’s a crisp **reinforcement of yesterday’s Jenkins + Docker work**:

---

## 🔁 Recap of 25 August 2025

1. **Jenkins Setup**

   * Ran Jenkins in Docker on Gitpod.
   * Installed Docker inside Jenkins container, mounted `/var/run/docker.sock`.
   * Verified Jenkins could run `docker build` + `docker run`.

2. **Pipeline (Jenkinsfile)**

   * **Stages:**

     1. Checkout GitHub repo.
     2. Build Docker image (tag = build number).
     3. Smoke Test → run container + curl `/health`.
     4. Tag & Push to GHCR (with PAT via Jenkins credentials).
     5. Verify image by pulling from GHCR + rerun container.
   * **Post-actions:** cleaned up unused images with `docker system prune`.

3. **GHCR Integration**

   * Created PAT with `write:packages`.
   * Added Jenkins credential (`ghcr-token`).
   * Logged in and successfully pushed → image visible at `ghcr.io/nightwalker9999/docker-flask-opt`.

4. **Debugging**

   * Fixed `docker: not found` by installing Docker inside Jenkins.
   * Fixed missing `Dockerfile` path by using `dir("${DOCKERFILE_DIR}")`.
   * Learned to troubleshoot SCM checkout (main vs master mismatch).
   * Validated health endpoint inside container with `docker exec curl`.

---

## 💡 Concepts Reinforced

* **CI/CD Flow** = *Checkout → Build → Test → Push → Deploy*.
* **Immutable artifacts** (images) → reproducibility.
* **Secrets management** → use Jenkins credentials, not hardcoded tokens.
* **Fail fast principle** → if health check fails, pipeline stops.
* **Debugging ladder** → check Jenkins config → Docker install → registry creds → app health.


