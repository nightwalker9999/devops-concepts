---

### 03-git-workflows/exercise/README.md

# Exercise: Hands-On with Git Workflow

**Objective:** Practice creating branches, merging via PR, and triggering CI.

## Steps

1. **Initialize & Connect**  
   ```bash
   mkdir demo-repo && cd demo-repo
   git init
   git remote add origin <your-github-URL>

## Branching Strategy Lab

**Goal:** Explore practical branching in a high-contributor project and simulate a hotfix.

### 1. Clone Kubernetes Repo (shallow)

```bash
git clone --depth=1 https://github.com/kubernetes/kubernetes.git
cd kubernetes


# Day 11 Exercises

Follow these steps in your local repo to practice today’s Git workflows.

1. **Initialize & Remote**  
   ```bash
   mkdir git-demo && cd git-demo
   git init
   git remote add origin <YOUR-REPO-URL>

2.	**Create & Commit**

   echo "echo Hello DevOps" > hello.sh
   git add hello.sh
   git commit -m "feat: add hello.sh demo script"
   git push -u origin main

3.	**Feature Branch Workflow**

   git checkout -b feature/add-greeting
   echo "echo Greetings from feature" >> hello.sh
   git add hello.sh
   git commit -m "feat: extend hello.sh with greeting"

4.	Rebase & Merge
   git fetch
   git rebase origin/main
   git checkout main
   git merge --no-ff feature/add-greeting -m "chore: merge add-greeting"
   git push

5.	Tag & Inspect

   git tag -a v0.1.1 -m "Add greeting feature"
   git push origin v0.1.1
   git log --oneline --decorate

