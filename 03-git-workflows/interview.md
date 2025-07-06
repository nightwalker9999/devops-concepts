---

### 03-git-workflows/interview.md

```markdown
# Interview Drill: Git Workflows

1. **Q:** For a large team with rapid releases, which branching model do you prefer and why?  
   **A:** I’d use Trunk-Based Development with very short-lived feature branches and feature flags, because it minimizes merge conflicts, ensures frequent integration, and allows rapid, low-risk releases.

2. **Q:** Explain how you’d set up branch protection on `main`.  
   **A:** Enforce required status checks (CI build/tests), require at least one approving review, disallow force pushes, and optionally require signed commits to ensure code quality and auditability.

3. **Q:** Describe the difference between `git merge` and `git rebase`.  
   **A:** `git merge` combines branches with a merge commit, preserving history; `git rebase` reapplies commits on top of another branch for a linear history but rewrites commit IDs.

4. **Q:** How would you recover if you accidentally force-pushed a broken commit to `main`?  
   **A:** I’d use `git reflog` to find the last known good commit hash and then `git reset --hard <good-hash>` locally, followed by `git push --force-with-lease` to restore `main` safely, ensuring I coordinate with the team first.