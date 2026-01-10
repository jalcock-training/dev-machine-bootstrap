# Linux Workstation Bootstrap

A clean, repeatable bootstrap environment for Fedora and Rocky Linux workstations.

This repository provides:

- Idempotent setup scripts for core tools (Terraform, Azure CLI, VSCodium, Git)
- Curated VSCodium extensions for senior engineering workflows
- Cheatsheets for Git, Terraform, Markdown, linting, and system operations
- System documentation for SSH, terminal setup, Docker/Podman, fonts, and more

The goal is simple: rebuild a complete engineering environment in minutes, anywhere.

---

## Repository structure

scripts/        - Automated installers for tools and extensions  
vscode/         - Extensions list and editor configuration  
cheatsheets/    - High-impact reference guides  
system/         - Machine-level setup notes and operational knowledge  

---

## Quick start

Run the full bootstrap:

    cd scripts
    ./bootstrap-all.sh

This installs:

- Core packages
- VSCodium
- Terraform
- Azure CLI
- Git configuration
- All recommended extensions

---

## Scripts overview

install-packages.sh  
- Installs core development tools (git, curl, jq, python3, direnv, etc.).

install-vscodium.sh  
- Adds the VSCodium RPM repo and installs the editor.

install-vscodium-extensions.sh  
- Installs all extensions listed in vscode/extensions.txt.

install-terraform.sh  
- Adds the HashiCorp repo and installs Terraform.

install-azure-cli.sh  
- Adds the Microsoft repo and installs Azure CLI.

setup-git.sh  
- Configures Git identity, editor, and SSH keys.

bootstrap-all.sh  
- Runs everything in the correct order.

---

## VSCodium extensions

The curated extension list lives in:

vscode/extensions.txt

It includes, at minimum:

- hashicorp.terraform
- yzhang.markdown-all-in-one
- eamodio.gitlens
- redhat.vscode-yaml
- hediet.vscode-drawio
- usernamehw.errorlens
- timonwong.shellcheck
- streetsidesoftware.code-spell-checker

These are selected for maximum productivity with minimal clutter.

---

## Cheatsheets

Located in cheatsheets/, covering:

git.md  
- Common commands  
- Feature branch workflow  
- Branch naming conventions  
- Commit message conventions  

terraform.md  
- Init, format, validate, plan, apply, destroy  
- State and workspace commands  

markdown.md  
- Headings, lists, code, links, images, tables  
- Blockquotes, horizontal rules, task lists  

precommit.md, linting.md, prettier.md  
- Pre-commit checks  
- Linting commands  
- Prettier usage patterns  

These are designed as fast references during day-to-day engineering.

---

## System documentation

Located in system/, capturing machine-level setup:

ssh-setup.md  
- Generate SSH keys  
- Configure ssh-agent  
- Add keys to GitHub  
- Basic ~/.ssh/config examples  

terminal-setup.md  
- Preferred fonts and terminal profile  
- Shell configuration and aliases  
- direnv setup  

docker-setup.md (or podman-setup.md)  
- Install and configure container runtime  
- Enable service and verify  

cloud-cli-setup.md  
- Azure CLI login patterns  
- Notes on OIDC and common commands  

system-tweaks.md  
- RPM Fusion, codecs, power tweaks, firewall, SELinux notes  

This folder is the operational memory of your workstation setup.

---

## Git workflow

Typical feature branch workflow:

    git checkout -b type/new-branch-name
    # edit, lint, test
    git add <files>
    git commit -m "type: short, imperative message"
    git push

After merge:

    git checkout main
    git pull
    git branch -d type/new-branch-name

### Branch naming conventions

Format:

    type/short-description

Common types:

- feat/   - new feature  
- fix/    - bug fix  
- docs/   - documentation changes  
- refactor/ - code restructuring without behavior change  
- chore/  - maintenance, cleanup, dependency bumps  
- test/   - adding or updating tests  
- ci/     - CI/CD pipeline changes  
- perf/   - performance improvements  
- style/  - formatting, whitespace, lint fixes (no logic changes)  

Examples:

- feat/add-azure-static-web-module  
- fix/terraform-output-bug  
- docs/update-readme-bootstrap  
- refactor/module-structure-cleanup  
- ci/add-tflint-to-pipeline  

### Commit message conventions

Format:

    type: short, imperative description

Common types:

- feat:   - a new feature  
- fix:    - a bug fix  
- docs:   - documentation only  
- refactor: - code restructuring  
- chore:  - maintenance tasks  
- test:   - adding or updating tests  
- ci:     - CI/CD changes  
- perf:   - performance improvements  
- style:  - formatting only (no logic changes)  
- revert: - revert a previous commit  

Examples:

- feat: add static site module  
- fix: correct resource group name  
- docs: update bootstrap instructions  
- refactor: simplify module outputs  
- chore: bump terraform provider versions  
- ci: add markdownlint to workflow  

---

## Future enhancements

- Optional Docker/Podman install script  
- Optional kubectl and Helm install script  
- Optional Bicep CLI installer  
- Optional pre-commit configuration and hooks  
- Optional system health check script  

---

## License

MIT License — use, modify, and adapt freely.
