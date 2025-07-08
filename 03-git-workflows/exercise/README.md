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
