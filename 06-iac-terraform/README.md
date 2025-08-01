# DevOps Environment Setup in Gitpod

This project uses **Gitpod** for cloud-based development with automated provisioning of key DevOps tools—**Terraform** and **AWS CLI**—via installer scripts, to create a reproducible and hassle-free workspace every time.

## Directory Layout
/├── bin/
│   ├── install_terraform_cli     # Script to install Terraform
│   └── install_aws_cli           # Script to install AWS CLI
├── .gitpod.yml                  # Workspace config that runs installer scripts and configures VS Code extensions
├── …                         # Your Terraform configs and other files


## How It Works

- On workspace start, Gitpod runs the scripts in `bin/` to install Terraform and AWS CLI with root permissions.
- These scripts install tools into system-wide directories, ensuring all shell sessions recognize them without manual `PATH` tweaks.
- VS Code extensions for Terraform and AWS are installed automatically.

## Usage Instructions

1. Open this repository in [Gitpod](https://gitpod.io).
2. When the workspace launches, installer scripts automatically run (you can watch their logs in the terminal).
3. Verify installations by running in the terminal:

terraform -version
aws –version

Both commands should display the installed versions without error.
4. Start your Terraform or AWS workflows immediately—no manual setup required.

## Customizing Tool Versions

- To update Terraform or AWS CLI versions, edit the respective scripts in `bin/` (`install_terraform_cli` and `install_aws_cli`).
- The scripts use environment variable `PROJECT_ROOT` for workspace portability, making them reusable across projects.

## Clean and Reproducible Workflow

- We avoid complex Dockerfile customizations and manual environment configurations.
- Installer scripts use `sudo` and official repos or installers, following best practices.
- The setup is fully reproducible and ideal for individual use or team onboarding.

## VS Code Extensions

- `amazonwebservices.aws-toolkit-vscode` — AWS Toolkit integration
- `hashicorp.terraform` — Terraform language support

These are auto-installed every time the workspace starts.

---

