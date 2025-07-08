# Interview Drill: Virtual Machines

1. **Question:** Explain what a hypervisor does and why it’s critical for virtualization.  
   **Answer:** A hypervisor sits between hardware and VMs, allocating CPU, memory, and I/O to each VM, ensuring isolation and multiplexing on a single host.

2. **Question:** When would you prefer a VM instead of a Docker container in your infrastructure?  
   **Answer:** When needing full OS isolation, kernel-level features, or hosting legacy applications not compatible with container runtimes.

## Advanced Branching Drills

5. **Q:** Describe how you’d create and merge a hotfix in a live codebase.  
   **A:** I’d branch off the active release branch (e.g. `hotfix/1.2.1` from `release-1.2`), apply the fix, then merge into both the release branch and `main`, opening PRs for each and ensuring CI passes.

6. **Q:** How would you keep your `main` branch up-to-date while working on long-lived feature branches?  
   **A:** I’d regularly `git fetch` and `git rebase main` (or `git merge main`) into my feature branch to integrate ongoing changes and minimize large merge conflicts.

7. **Q:** Kubernetes has thousands of contributors—why does its branching model (feature/release/hotfix) scale?  
   **A:** It isolates work streams by purpose, lets maintainers control stable release preparation separately from day-to-day development, and provides a clear workflow for urgent fixes without disrupting ongoing features.   