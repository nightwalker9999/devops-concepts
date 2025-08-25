# Exercise 01: Baseline Dockerfile

**Goal**: Create a simple Python app Dockerfile and record its size.

### Build Commands
```bash
docker build -t docker-baseline:1 .
docker images | grep docker-baseline
```

### Result
```bash
gitpod /workspace/devops-concepts/07-docker-containers/exercise/01_baseline_dockerfile (main) $ docker build -t docker-baseline:1 .
[+] Building 5.3s (10/10) FINISHED                                                                                                                              docker:default
 => [internal] load build definition from Dockerfile                                                                                                                      0.0s
 => => transferring dockerfile: 187B                                                                                                                                      0.0s
 => [internal] load metadata for docker.io/library/python:3.10-slim                                                                                                       0.1s
 => [internal] load .dockerignore                                                                                                                                         0.0s
 => => transferring context: 70B                                                                                                                                          0.0s
 => [1/5] FROM docker.io/library/python:3.10-slim@sha256:420fbb0e468d3eaf0f7e93ea6f7a48792cbcadc39d43ac95b96bee2afe4367da                                                 2.1s
 => => resolve docker.io/library/python:3.10-slim@sha256:420fbb0e468d3eaf0f7e93ea6f7a48792cbcadc39d43ac95b96bee2afe4367da                                                 0.0s
 => => sha256:e3c437eb1623e9086f42038c1273a7eff09cfff44d7c2ece721fa61560af7e1f 1.75kB / 1.75kB                                                                            0.0s
 => => sha256:c2c9cfb78b6afd7fa4f08488dabdd4482417fa3bbc3571425c20b53d66636fc0 5.38kB / 5.38kB                                                                            0.0s
 => => sha256:7732878f45d9e71f91ce50493915297cca1bde392445d9ddcc0f378a200967bf 1.29MB / 1.29MB                                                                            0.4s
 => => sha256:72e8e193aa94d19c7f1bcbc00737a83d1906bcc1e51965c2873f081eb87bd3a0 14.10MB / 14.10MB                                                                          0.4s
 => => sha256:3a195ff1e16155a2ca71eee2cc2c4e467119c644d0360b7c2f6e6d9633f9358b 250B / 250B                                                                                0.4s
 => => sha256:420fbb0e468d3eaf0f7e93ea6f7a48792cbcadc39d43ac95b96bee2afe4367da 10.37kB / 10.37kB                                                                          0.0s
 => => extracting sha256:7732878f45d9e71f91ce50493915297cca1bde392445d9ddcc0f378a200967bf                                                                                 0.2s
 => => extracting sha256:72e8e193aa94d19c7f1bcbc00737a83d1906bcc1e51965c2873f081eb87bd3a0                                                                                 1.3s
 => => extracting sha256:3a195ff1e16155a2ca71eee2cc2c4e467119c644d0360b7c2f6e6d9633f9358b                                                                                 0.0s
 => [internal] load build context                                                                                                                                         0.0s
 => => transferring context: 159B                                                                                                                                         0.0s
 => [2/5] WORKDIR /app                                                                                                                                                    0.2s
 => [3/5] COPY requirements.txt .                                                                                                                                         0.1s
 => [4/5] RUN pip install --no-cache-dir -r requirements.txt                                                                                                              2.6s
 => [5/5] COPY . .                                                                                                                                                        0.0s
 => exporting to image                                                                                                                                                    0.2s
 => => exporting layers                                                                                                                                                   0.1s
 => => writing image sha256:352eeb14245efb7544586a7108f96829ab98115a7d224a205fec38bc64bade40                                                                              0.0s
 => => naming to docker.io/library/docker-baseline:1                                                                                                                      0.0s
gitpod /workspace/devops-concepts/07-docker-containers/exercise/01_baseline_dockerfile (main) $ docker images | grep docker-baseline
docker-baseline         1         352eeb14245e   21 seconds ago   129MB