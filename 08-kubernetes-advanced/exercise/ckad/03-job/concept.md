
---

# 📘 Kubernetes Job — CKAD One-Page Notes

---

## 1️⃣ What is a Job?

A **Job** is a Kubernetes controller that **runs Pods until a task completes successfully**.

* Used for **one-time / batch workloads**
* Ensures **successful completion**
* Not meant for long-running services

> **Key idea:**
> Deployment = keeps running
> Job = runs → finishes → exits

---

## 2️⃣ When to Use a Job?

✔ Database migrations
✔ Batch processing
✔ Cleanup tasks
✔ Data imports / exports
✔ CI/CD one-off tasks
✔ Scripts that must finish

❌ APIs
❌ Web services
❌ Anything needing continuous availability

---

## 3️⃣ Job vs Deployment (Must Remember)

| Feature           | Job        | Deployment |
| ----------------- | ---------- | ---------- |
| Runs continuously | ❌          | ✅          |
| Has completion    | ✅          | ❌          |
| Pod ends          | Completed  | Running    |
| Restart behavior  | On failure | Always     |
| Readiness probe   | ❌          | ✅          |

---

## 4️⃣ Important Job Fields (HIGH IMPORTANCE)

```yaml
spec:
  completions: 5
  parallelism: 2
  backoffLimit: 6
```

### 🔹 `completions`

* Total **successful Pod runs required**

### 🔹 `parallelism`

* Max Pods running **at the same time**

Example:

```
completions = 5
parallelism = 2
```

➡️ Kubernetes creates **5 Pods total**, **2 at a time**

---

## 5️⃣ Pod Behavior in a Job

* Each Pod:

  * Starts
  * Runs task
  * Exits
* Status becomes `Completed`
* No readiness probe
* Logs are preserved

```bash
kubectl logs <pod-name>
```

---

## 6️⃣ Failure & Retry Handling

### 🔹 `restartPolicy`

* Usually `Never`

### 🔹 `backoffLimit`

* Max retry attempts before Job fails

If retries exceed limit:
➡️ Job status = **Failed**

---

## 7️⃣ Cleanup & Deletion

```bash
kubectl delete job <job-name>
```

* Job deleted
* All Pods deleted automatically
* Uses Kubernetes **garbage collection**

Optional:

```bash
--cascade=orphan
```

➡️ Keeps Pods after deleting Job

---

## 8️⃣ Types of Jobs

### 1️⃣ Non-Parallel Job

* Single execution
* Example: DB migration

```yaml
completions: 1
parallelism: 1
```

---

### 2️⃣ Parallel Job

* Multiple independent executions
* Example: batch processing

```yaml
completions: 5
parallelism: 2
```

---

### 3️⃣ Indexed Job (Advanced / CKAD+)

* Each Pod gets an index
* Used for partitioned workloads

```yaml
completionMode: Indexed
```

Pod env:

```
JOB_COMPLETION_INDEX
```

---

## 9️⃣ CronJob (Related Concept)

* Scheduled Job
* Creates Jobs on a schedule

Examples:

* Nightly cleanup
* Backups
* Log rotation

> CronJob ➝ creates Job ➝ creates Pods

---

## 🔟 One-Line Interview Answers

* **Job:** Runs tasks until completion
* **completions:** Total successful runs
* **parallelism:** Concurrent Pods
* **backoffLimit:** Retry limit
* **Job vs Deployment:** Task vs Service

---

## 🧠 Final Memory Anchor

> **Job = Run → Complete → Exit**
> **Deployment = Run → Stay Alive**

---
