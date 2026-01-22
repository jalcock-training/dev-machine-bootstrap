# Linting Cheatsheet

## Terraform
terraform fmt -recursive
terraform validate
tflint
trivy config .

## YAML
yamllint .

## Markdown
npx markdownlint "**/*.md"

## Prettier (Markdown, JSON, YAML)
npx prettier --check "**/*.{md,json,yaml,yml}"
npx prettier --write "**/*.{md,json,yaml,yml}"


## Shell
shellcheck scripts/*.sh

## JSON
jq . <file.json>              # validate JSON

## EditorConfig
editorconfig-checker          # validate formatting rules



# Markdown Linting Setup

## Install
npm init -y
npm install --save-dev prettier markdownlint-cli markdownlint-cli2

## Prettier config
./.prettierrc
{
  "printWidth": 100,
  "proseWrap": "always",
  "singleQuote": false,
  "tabWidth": 2
}

./.prettierignore
node_modules
terraform/

## Markdownlint config
./.markdownlint.json

{
  "default": true,
  "MD013": false
}

or

{
  "default": true,
  "MD013": false,
  "MD033": false,
  "MD024": {
    "siblings_only": true
  }
}

MD013 off → no line‑length warnings
MD033 off → allows inline HTML (useful for ADR anchors if needed)
MD024 siblings_only → prevents false positives for repeated headings in different sections
