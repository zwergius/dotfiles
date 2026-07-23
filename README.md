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

The default installer exposes shared companion files under
`~/.config/agents/` and repo-owned skills under `~/.agents/skills/` without
replacing other installed skills. Codex discovers skills from that location.

On a Hermes Agent machine, install only the shared agent guidance and skills:

```sh
./bin/make.sh --hermes
```

This links the companion catalog to `~/.config/agents/`, installs each repo-owned
skill in the canonical `~/.agents/skills/` directory, and links those skills into
Hermes's primary `~/.hermes/skills/` directory. It does not install the shell,
editor, terminal, Homebrew, Git, or Codex configuration from this repo, and it
leaves other Hermes skills and configuration untouched.

Run `$setup-agent-workflows` in Codex or `/setup-agent-workflows` in Hermes to
preview and add the shared Way of Working plus selected local-companion and
upstream-reference triggers to a project's `AGENTS.md`. When Matt Pocock's
project configuration is absent, the skill can optionally install and run its
setup first so issue-tracker, triage-label, and domain-doc guidance is available
for companion selection.
