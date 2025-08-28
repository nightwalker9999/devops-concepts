### Docker Compose 
#### Task - Create docker-compose.yml (folder: 04_docker-compose-lab)

#### 1. Create docker-compose.yml:
```yaml
version: "3.8"
services:
  app:
    build: .
    depends_on:
      - redis
  redis:
    image: redis:alpine # <-- add this line
```

#### 2. Build & run:        
```bash 
docker-compose up --build
```

#### 3. Add this code in app.py:
```python
import redis

r = redis.Redis(host="redis", port=6379)
print("Redis ping:", r.ping())
```

#### Key Takeaways:
- Docker Compose is a tool for defining and running multi-container Docker applications.
- It allows you to define the services and their dependencies in a single file, and then run them all together.
- It is a powerful tool for managing complex Docker applications, especially when you have multiple services and dependencies.

Questions:
- Q. What is the difference between a Docker run and a Docker Compose run?
    - A Docker run starts a single container from an image, while a Docker Compose run starts multiple containers from a single image.

- Q. Difference between multi-stage build (one image, smaller) vs multi-service orchestration (multiple containers working together)?
    - A multi-stage build is a single image that contains multiple stages for doing different tasks. (Eg. Installing deps as builder, then copying code into runtime.)
    - A multi-service orchestration is a set of multiple containers that work together, each with its own Dockerfile.
    (Eg. flask app + redis )

- Q. How does services communicate?
    - Docker compose creates a bridge network automatically, services can communicate with each other via names.   
    