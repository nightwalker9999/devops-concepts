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