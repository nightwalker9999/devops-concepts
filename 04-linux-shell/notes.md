### Date: 29 Sep 2025

````bash
mkdir -p 04-linux-shell/exercise/process
tee 04-linux-shell/exercise/process/notes.md >/dev/null << 'MD'
# Linux Processes & Signals — Notes (29 Sep 2025)

## 1) Quick process listings I ran
```bash
ps -e | head -n 5
ps
ps aux
````

**Why three variants?**

* `ps -e` = all processes (system-wide).
* `ps` (no flags) = processes on the current TTY (your shell).
* `ps aux` = BSD style: all users, all processes, with full columns.

**Sample observations from my run**

* System processes like `supervisor`, `node` were visible.
* My interactive shells showed as `/bin/bash` with TTY like `pts/1`.
* `ps` showed only my current session’s processes (e.g., `bash`, `ps`).

**Reading the columns (ps aux)**

* **PID**: unique process ID.
* **TTY**: controlling terminal (`?` = none; daemons).
* **STAT**: process state and flags. Common ones I saw:

  * `S` = sleeping, `R` = running, `<` = high-priority, `l` = multithreaded.
* **%CPU / %MEM**: current CPU/memory usage snapshot.
* **COMMAND**: binary/command that started the process.

---

## 2) Background job + job control

```bash
sleep 120 &     # put a command to background; prints a job number and PID
jobs            # list background jobs
```

Output matched:

* `[1] 6903` (job 1, PID 6903)
* `jobs` showed “Running” or “Stopped” depending on signal sent.

---

## 3) Signals I used (on the `sleep` process)

```bash
kill -SIGSTOP 6903   # pause (stop) the process (like Ctrl+Z programmatically)
kill -SIGCONT 6903   # continue a stopped process
kill -SIGTERM 6903   # ask the process to terminate gracefully
```

**What I observed**

* After `SIGSTOP`: `jobs` showed **Stopped**.
* After `SIGCONT`: `jobs` showed **Running** again.
* After `SIGTERM`: job terminated → `Terminated sleep 120`.

**Cheat meanings**

* **SIGSTOP**: uncatchable stop; process halts immediately.
* **SIGCONT**: resume a stopped process.
* **SIGTERM**: polite “please exit.” (Program can handle/cleanup.)

  * (**SIGKILL** would be forceful: `kill -9 <pid>`—not used here.)

---

## 4) Small correction I learned

I mistakenly tried:

```bash
ps aux | grep -v grep | dcokerd   # typo: dcokerd (wrong) 
ps aux | grep -v grep | dockerd   # this actually tried to RUN dockerd reading stdin (also wrong)
```

**Fix:** I intended to **search** for `dockerd`, not pipe into it. Correct usage:

```bash
ps aux | grep -v grep | grep dockerd
# or better:
pgrep -af dockerd
```

---

## 5) Quick self-check (write answers in one line)

* What does **STAT** letter `R` vs `S` mean?
    * R -> Running Processes currently getting utilized by CPU / Taking up CPU utilization.
    * S -> Sleeping (waiting/blocked) till some resource is found.

* Why did `ps` without flags show fewer processes than `ps -e`?
    *  `ps -e` shows the processes system wide, while `ps` without flags shows the processes for that current TTY (Terminal)
* What’s the difference between **SIGTERM** and **SIGKILL**?
    * `SIGTERM` -> safe way to terminate, terminal handles the cleanup, while `SIGKILL` is forcefully killed.

---

## 6) What I learned today (my own bullets)

* `ps -e`, `ps`, `ps aux` show different scopes/columns; know when to use which.
* I can stop/continue/terminate a process with **SIGSTOP/SIGCONT/SIGTERM**.
* Don’t pipe into daemons by mistake; use `grep`/`pgrep` to **search**.


### Date: 1 Oct 2025 

* Fundamentals of Linux
  * OS -> Interaction layer between Hardware & User + Apps
* Linux Components 
  * Hardware -> Linux Kernel -> System Utils -> System Libs -> Shell -> Apps
* Linux Distributions
  * Ubuntu, Redhat, OpenSUSE, Fedora etc. (Same underlying linux with additional functions, wrappers, modifications etc.)
* Linux Setup
  * For Windows -> Use WSL
  * Docker -> gives an easy to use linux distribution container (can be used on windows or any other OS)
* Package Managers
  * This is built-in tool for installing (deploying), updating, deleting, maintaining dependencies/software in a linux system.
  Eg. apt is quite popular on Ubuntu/Debian. Fedora, RHEL, CentOS uses dnf and other linux distro uses other ones. They work by fetching software from the official repos (checks for the package), download the package and it's dependencies, then install and configures the software.