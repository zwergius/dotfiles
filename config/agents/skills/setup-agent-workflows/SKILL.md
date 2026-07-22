---
name: setup-agent-workflows
description: Set up shared project workflows in AGENTS.md, including optional project integrations such as Svelte MCP configuration.
---

# Setup Agent Workflows

Set up a portable project instruction chain without replacing hand-maintained
project guidance. Materialize the always-relevant Way of Working inline and keep
task-specific companions behind explicit read triggers.

## Workflow

1. Find the repository root and read its existing `AGENTS.md`, if present.
2. Read `~/.config/agents/AGENTS.md` and confirm that it contains exactly one
   `agent-workflows:shared` marker pair.
3. Discover available companions from `~/.config/agents/*.md`, excluding
   `AGENTS.md` and ignored `*.local.md` files.
4. Inspect `package.json` and framework configuration files. If the project
   depends on `svelte` or `@sveltejs/kit`, or contains `svelte.config.*`,
   recommend the upstream Svelte agent instructions as a remote reference:
   `Svelte=https://svelte.dev/docs/ai/instructions/llms.txt`.
5. If `docs/agents/issue-tracker.md` exists, read it and recommend the
   `issue-tracker` companion regardless of which provider it configures. Do not
   recommend provider-specific companions for the same responsibility.
6. Recommend other companions only when justified by the repository or the
   user's stated workflow. Do not select every companion by default.
7. Ask the user to confirm the companion selection. Keep this to one concise
   question.
8. Preview the generated diff with `scripts/configure.py`. Never skip the
   preview when the target already contains project guidance.
9. Show the proposed generated section and ask the user to review it before
   writing.
10. After confirmation, run the script with `--write`.
11. Run the same command with `--check` and inspect `git diff --check`.
12. For a confirmed Svelte project, inspect the repository for an existing
    Svelte MCP configuration. Explain that the remote reference supplies current
    instructions but does not configure an MCP client. If project-level Svelte
    MCP configuration is missing, ask whether to run the official interactive
    installer. Only after explicit confirmation, run `npx sv add mcp` from the
    repository root, let it collect the client and local-or-remote choices, and
    inspect every resulting file and the full diff. Do not synthesize or maintain
    client-specific MCP configuration in this skill.

Use commands in this shape:

```sh
python3 <skill-dir>/scripts/configure.py \
  --target <repo-root>/AGENTS.md \
  --companion git \
  --companion issue-tracker \
  --remote-reference \
    'Svelte=https://svelte.dev/docs/ai/instructions/llms.txt'
```

Add `--write` only after review. Add `--check` after writing. The default shared
source is `~/.config/agents/AGENTS.md`; pass `--source` only for testing or when
the installed catalog intentionally lives elsewhere.

## Invariants

- Treat the content between `agent-workflows:generated` markers as generated.
- Preserve every byte outside the generated block except the single separating
  blank line required when inserting a new block.
- Place a new generated block before existing project guidance so the later,
  more local instructions can override shared defaults.
- Never edit or patch the generated block manually. Change the shared source,
  companion selection, or setup script and rerun the skill.
- Never add ignored local companions, secrets, credentials, or absolute
  machine-specific paths to the generated block.
- Refer to companions through stable `~/.config/agents/<NAME>.md` paths.
- Do not assume that a Markdown reference loads a companion. Each generated
  entry must explicitly tell the agent when to read it.
- Do not assume that a URL loads its contents. Each generated remote reference
  must explicitly tell the agent when to fetch and follow it.
- Stop if marker pairs are missing, duplicated, nested, or incomplete. Do not
  guess which content is generated.

## Companion Boundaries

Keep foundational instructions that apply to nearly every task in the inline
Way of Working. Keep conditional procedures such as issue tracking, GitHub, or
frontend work in companions. If a companion repeats generic scoping, editing,
testing, or handoff rules, move those rules to the shared source instead of
generating both.

Project-specific commands, architecture, conventions, and exceptions stay
outside the generated block in the repository's `AGENTS.md`.

The upstream Svelte instructions and the official Svelte MCP add-on have
separate jobs. The remote reference supplies current, agent-neutral working
instructions. `npx sv add mcp` owns the optional client-specific configuration
and must remain an explicit, reviewed project mutation.
