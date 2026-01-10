# Terraform Cheatsheet

## Init & providers
terraform init                # initialize working directory
terraform init -upgrade       # upgrade providers

## Formatting & validation
terraform fmt -recursive      # format all files
terraform validate            # validate syntax

## Planning & applying
terraform plan                # show changes
terraform apply               # apply changes
terraform destroy             # destroy resources

## State commands
terraform state list          # list resources in state
terraform state show <addr>   # inspect resource
terraform refresh             # sync state with real world

## Modules
terraform get                 # download modules
terraform get -update         # update modules

## Workspaces
terraform workspace list
terraform workspace new dev
terraform workspace select dev
