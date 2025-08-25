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
