# Git Cheatsheet

## Feature Branch Workflow

```
# Create and switch to a new branch
git checkout -b type/new-branch-name

# Stage and commit changes
git add <files>
git commit -m "type: commit message"

# Push branch (first push may require upstream flag)
git push
git push --set-upstream origin type/new-branch-name

# After merge
git checkout main
git pull
git branch -d type/new-branch-name
```

## Branching
git switch -c <branch>        # create + switch
git switch <branch>           # switch branches
git branch -a                 # list all branches

## Staging & committing
git add .                     # stage all changes
git commit -m "message"       # commit
git restore <file>            # discard local changes

## Syncing with remote
git fetch                     # update remote refs
git pull                      # pull latest
git push                      # push branch

## Resetting
git reset --hard origin/main  # reset local to remote
git clean -fd                 # remove untracked files

## History & diff
git log --oneline --graph     # compact history
git diff                      # show changes
git blame <file>              # who changed what

## Stashing
git stash                     # stash changes
git stash pop                 # reapply stash

## Tags
git tag                       # list tags
git tag v1.0.0                # create tag
git push origin v1.0.0        # push tag

# Branch Naming Conventions

Use the format:

```
type/short-description
```

## Common Branch Types
- **feat/** — new feature
- **fix/** — bug fix
- **docs/** — documentation changes
- **refactor/** — code restructuring without behavior change
- **chore/** — maintenance, cleanup, dependency bumps
- **test/** — adding or updating tests
- **ci/** — CI/CD pipeline changes
- **perf/** — performance improvements
- **style/** — formatting, whitespace, lint fixes (no logic changes)

## Examples
- feat/add-azure-storage-module
- fix/terraform-output-bug
- docs/update-readme-bootstrap
- refactor/module-structure-cleanup
- ci/add-tflint-to-pipeline


# Commit Message Conventions

Use the format:

```
type: short, imperative description
```

## Common Commit Types
- **feat:** a new feature
- **fix:** a bug fix
- **docs:** documentation only
- **refactor:** code restructuring
- **chore:** maintenance tasks
- **test:** adding or updating tests
- **ci:** CI/CD changes
- **perf:** performance improvements
- **style:** formatting only (no logic changes)
- **revert:** revert a previous commit

## Examples
- feat: add static site module
- fix: correct resource group name
- docs: update bootstrap instructions
- refactor: simplify module outputs
- chore: bump terraform provider versions
- ci: add markdownlint to workflow
