# Detailed Notes & Q&A: Git Workflows & Branching Strategies

## 1. Centralized vs. Distributed VCS
- **Centralized (SVN/CVS):** Single server holds all history; if it’s down, no one can commit or pull.  
- **Distributed (Git):** Every clone contains the full history; developers can commit, branch, and share locally, then push when the remote is available.

## 2. Common Branching Models
1. **Feature-Branch Workflow**  
   - Each feature or bugfix lives in its own branch (`feature/foo`, `bugfix/bar`).  
   - Merged back to `main` (or `develop`) via pull request (PR).  
   - Keeps `main` always clean and deployable.

2. **GitFlow**  
   - Long-lived `develop` and `main` branches.  
   - `feature/*`, `release/*`, `hotfix/*` branches for controlled releases.  
   - Good for scheduled, versioned releases but adds overhead.

3. **Trunk-Based Development**  
   - Small, short-lived branches (or direct commits) to `main`.  
   - Emphasizes continuous integration and feature flags.  
   - Ideal for rapid delivery and microservices.

## 3. Key Commands & Practices
- **Create & Switch Branch**  
  ```bash
  git checkout -b feature/<name>

### 4. Branch Types

- **Main (Trunk) Branch**  
  - Always up-to-date with the latest development snapshot.  
  - All branch merges (feature, hotfix, release) ultimately flow back here.

- **Feature Branches**  
  - Created for new or breaking features (`feature/<name>`).  
  - Isolate work until it’s stable, then merge back to `main`.

- **Release Branches**  
  - Cut from `main` when you’re ready to prepare a new version (e.g. `release/v1.2`).  
  - Used for final QA and bug fixes; no new features added here.  
  - Ship production releases from this branch.

- **Hotfix Branches**  
  - Created from a `release/*` or `main` when a critical fix is needed in production.  
  - Short-lived: fixes go back into both the active `release/*` and `main`.

---

## 5. Kubernetes Example

- Kubernetes’ repo on GitHub uses:
  - **main** for active development  
  - dozens of **feature/** branches (e.g. `feature/limitrange`) for new work  
  - **release/x.y** branches (e.g. `release-1.26`) for each version cycle  
  - ad-hoc **hotfix/** branches when urgent production fixes arise  

---

## 6. Additional Refined Q&A

**Q5: Why create a release branch?**  
A release branch lets you freeze features for final testing and bug fixes, ensuring `main` remains open for ongoing development and that your release is reproducible.

**Q6: How do hotfix branches differ from feature branches?**  
Hotfix branches address urgent production issues and merge back into both the relevant release branch and `main`, whereas feature branches focus on planned new functionality and only merge into `main`.