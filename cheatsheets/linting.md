# Linting Cheatsheet

## Terraform
terraform fmt -recursive
terraform validate
tflint
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
