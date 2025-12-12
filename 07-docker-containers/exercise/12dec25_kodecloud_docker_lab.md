# Tasks & Your Actions

1. Check Container Count

Command used:

```bash  
docker ps -a
```  
**Result:**  6 containers (running and exited)

---

2. Clean Up Images on the Host

- Initial Attempt

  Tried deleting an image using a container ID — this is not the correct method.

- Correct Approach

```bash
docker images -q | xargs docker rmi -f
```
**Result:** Successfully removed all images.

---

3. Container Cleanup (Implied)

- You may have removed containers using:

```bash
docker rm <container_id>
```

Or used docker ps -a simply to view them.

---

## Alternative Approaches

- Remove Containers Before Images

```bash
docker ps -a -q | xargs docker rm -f
```
- Remove All Containers and Images
```bash
docker ps -a -q | xargs docker rm -f
docker images -q | xargs docker rmi -f
```
- Use docker system prune (Be Cautious!)
```bash
docker system prune -a
```
This removes all unused containers, images, networks, and build cache.

---
