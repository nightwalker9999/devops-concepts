# Changelog

## [v0.1.0] – 2025-07-11
### Completed
- **Module 1:** SDLC & Organizational Roles  
- **Module 2:** Virtual Machines & Hypervisors  
- **Module 3:** Git Workflows & Branching Strategy  
  - Day-9 Git fundamentals, branches, remotes  
  - Day-10 Branching models: main, feature, release, hotfix  
- Notes, exercises, and interview drills for each module

### Troubleshooting - Localstack (AWS Emulator CLI)
```bash
# 1) Find the user bin where pip --user installs scripts
USER_BIN="$(python3 -c 'import site, os; print(os.path.join(site.USER_BASE, "bin"))')"
echo "USER_BIN=$USER_BIN"

# 2) See if localstack/awslocal are there
ls -l "$USER_BIN" | egrep 'localstack|awslocal' || true

# 3) Add that dir to PATH for this shell and persist it
export PATH="$USER_BIN:$PATH"
echo "export PATH=\"$USER_BIN:\$PATH\"" >> ~/.bashrc
hash -r

# 4) Verify
which localstack || echo "localstack still not found"
which awslocal  || echo "awslocal still not found"
localstack --version || true
awslocal --version   || true
```