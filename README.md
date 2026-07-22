# dotfiles
My dotfiles

## Installaction
Clone this repo & [nvim repo](https://github.com/zwergius/kickstart.nvim)  

cd to project & run

```
./bin/make.sh
```

open new tab in terminal

install homebrew https://brew.sh

install homebrew packages - run in terminal:
```
brew bundle
```

clone and run https://github.com/kristovatlas/osx-config-check

## Shared agent workflows

The installer exposes shared companion files under `~/.config/agents/` and
repo-owned skills under `~/.agents/skills/` without replacing other installed
skills.

Codex discovers skills from `~/.agents/skills/`. For Hermes Agent, add the same
directory to `~/.hermes/config.yaml`:

```yaml
skills:
  external_dirs:
    - ~/.agents/skills
```

Run `$setup-agent-workflows` in Codex or `/setup-agent-workflows` in Hermes to
preview and add the shared Way of Working plus selected companion triggers to a
project's `AGENTS.md`.
