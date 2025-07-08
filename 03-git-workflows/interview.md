---

### 03-git-workflows/interview.md

# Interview Drill: Git Workflows

1. **Q:** For a large team with rapid releases, which branching model do you prefer and why?  
   **A:** I’d use Trunk-Based Development with very short-lived feature branches and feature flags, because it minimizes merge conflicts, ensures frequent integration, and allows rapid, low-risk releases.

2. **Q:** Explain how you’d set up branch protection on `main`.  
   **A:** Enforce required status checks (CI build/tests), require at least one approving review, disallow force pushes, and optionally require signed commits to ensure code quality and auditability.

3. **Q:** Describe the difference between `git merge` and `git rebase`.  
   **A:** `git merge` combines branches with a merge commit, preserving history; `git rebase` reapplies commits on top of another branch for a linear history but rewrites commit IDs.

4. **Q:** How would you recover if you accidentally force-pushed a broken commit to `main`?  
   **A:** I’d use `git reflog` to find the last known good commit hash and then `git reset --hard <good-hash>` locally, followed by `git push --force-with-lease` to restore `main` safely, ensuring I coordinate with the team first.

---

### `interview.md`

# Day 11 Interview Drill

**1. Fetch vs. Pull**  
- **Q:** When should you use `git fetch` instead of `git pull`?  
- **A:** Use `fetch` to review upstream changes without merging, so you can inspect before integrating.

---

**2. Merge vs. Rebase**  
- **Q:** Why rebase your feature branch before opening a PR?  
- **A:** Rebasing places your commits on top of the latest `main`, producing a clean, linear history without extra merge commits.

---

**3. Safe Undo**  
- **Q:** Why use `git revert` instead of `git reset --hard` on a shared branch?  
- **A:** `revert` adds an “undo” commit and preserves history, avoiding disruptions for other collaborators.

---

**4. Cherry-Pick Use Case**  
- **Q:** When would you use `git cherry-pick`?  
- **A:** To apply a single commit from another branch, without merging the entire branch’s history.

---