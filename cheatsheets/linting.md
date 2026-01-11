# Linting Cheatsheet

## Terraform
terraform fmt -recursive
terraform validate
tflint
tflint --recursive
trivy config .

## YAML
yamllint .

## Markdown
markdownlint "**/*.md"

## Shell
shellcheck scripts/*.sh

## JSON
jq . <file.json>              # validate JSON

## EditorConfig
editorconfig-checker          # validate formatting rules

# terraform-docs

terraform-docs markdown table .
terraform-docs .
terraform-docs -c ../../../.terraform-docs.yml --output-file README.md --output-mode inject .

# Prettier

npx prettier --check .
npx prettier --check . --loglevel debug
npx prettier --write .

# Markdown lint

npx markdownlint '**/*.md'
npx markdownlint '**/*.md' --fix
