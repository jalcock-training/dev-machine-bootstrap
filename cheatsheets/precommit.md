# Pre-Commit Checks

## Terraform
terraform fmt -recursive
terraform validate

## Linting
tflint
trivy config .

## Markdown
markdownlint "**/*.md"

## YAML
yamllint .

## Shell scripts
shellcheck scripts/*.sh

## Prettier (Markdown, JSON, YAML)
prettier --write "**/*.{md,json,yaml,yml}"
