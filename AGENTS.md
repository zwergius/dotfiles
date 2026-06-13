# Dotfiles Repo Instructions

This repository contains public dotfiles and installer scripts for a personal
development environment. Keep changes small, explicit, and safe to publish.

## Repository Layout

- Root files such as `zshrc`, `vimrc`, `gitconfig`, and `Brewfile` are linked
  into `$HOME` by `bin/make.sh`.
- App configuration directories live under `config/` and are linked into
  `$HOME/.config/`.
- Reusable agent instructions live under `config/agents/`. Do not put global
  agent companion files in the repository root.
- Private machine-specific notes may live in ignored `*.local.md` files. Never
  commit, quote, or expose their contents.

## Editing Rules

- Preserve the public nature of this repo. Do not add secrets, token names,
  private credential commands, machine-local paths, or sensitive service details
  to tracked files.
- For GitHub, PR, issue, or CI work, read [GitHub](/Users/zwergius/.codex/GITHUB.md).
- Keep `bin/make.sh` idempotent: rerunning it should report already-linked files
  or create the same symlinks without changing tracked content.
- Prefer loops and conventions over hard-coded per-app config links when adding
  new folders under `config/`.
- Avoid broad refactors of shell files unless the task is specifically about the
  installer behavior.

## Local Merge Workflow

This repo does not require pull-request ceremony for routine personal dotfile
changes. Use a branch for isolation while editing, then when the work is complete:

1. Commit the branch.
2. Merge it into `master` locally.
3. Run `./bin/make.sh` from the main checkout, not from a temporary worktree.
4. Inspect the real symlinks under `$HOME/.codex` and `$HOME/.config/agents`.

Do not leave active home-directory symlinks pointing at temporary worktrees.

## Verification

For installer changes, run:

```sh
bash -n bin/make.sh
env HOME=/private/tmp/dotfiles-verify bash bin/make.sh
```

When changing public agent files, scan for private credential details before
publishing.

Before finishing installer or agent-config changes:

- Use a temporary `HOME` to verify the installer behavior without touching the
  real home directory.
- After merging locally, run the installer against the real home directory from
  the main checkout, then inspect the generated symlinks under `$HOME/.codex`
  and `$HOME/.config/agents`.
- Do not rely only on the temporary `HOME` check; it proves script behavior, not
  that the active user environment is up to date.
