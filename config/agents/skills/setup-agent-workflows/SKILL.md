---
name: setup-agent-workflows
description: Set up shared project workflows in AGENTS.md, including an optional Matt Pocock engineering-skills bootstrap, current upstream Web and Svelte references, and optional Svelte MCP configuration.
---

# Setup Agent Workflows

Set up a portable project instruction chain without replacing hand-maintained
project guidance. Materialize the always-relevant Way of Working inline and keep
task-specific companions behind explicit read triggers.

## Workflow

### Optional Engineering-Skills Bootstrap

1. Find the repository root and read its existing `AGENTS.md` and `CLAUDE.md`,
   when present.
2. Read `~/.config/agents/AGENTS.md` and confirm that it contains exactly one
   `agent-workflows:shared` marker pair.
3. Inspect the root instruction files for an `## Agent skills` section and
   inspect `docs/agents/issue-tracker.md`, `docs/agents/triage-labels.md`, and
   `docs/agents/domain.md` without assuming they exist.
4. Treat Matt Pocock's project configuration as complete only when its
   `## Agent skills` section and all three files exist. If complete, read them and
   continue to shared workflow selection. If missing or partial, summarize what
   is present and ask whether to set up or complete it before continuing. Explain
   that this optional setup configures the issue tracker, triage labels, and
   domain-document layout used by Matt Pocock's engineering skills.
5. If the user declines, continue without installing or changing those skills.
   Recommend the `issue-tracker` companion later only if a project-owned
   `docs/agents/issue-tracker.md` already exists.
6. If the user accepts, check whether `setup-matt-pocock-skills` is installed.
   If it is unavailable, ask for explicit approval before running the official
   interactive installer from the repository root:

   ```sh
   npx skills@latest add mattpocock/skills
   ```

   Let the user choose the skills and agent targets, and ensure
   `setup-matt-pocock-skills` is selected. Do not guess those choices or install
   an agent-specific adapter yourself.
7. Read the installed `setup-matt-pocock-skills/SKILL.md` completely and follow
   it directly. Preserve its separate prompts and draft review; do not collapse
   them into this skill or recreate its templates. If the host cannot rediscover
   a newly installed skill in the current session, locate and read its installed
   `SKILL.md` rather than pretending setup completed.
8. After that setup is confirmed complete, re-read the root instruction files
   and its three files under `docs/agents/`. Inspect the full project diff, then
   resume this workflow using the newly created configuration.

### Configure Shared Workflows

9. Discover available companions from `~/.config/agents/*.md`, excluding
   `AGENTS.md` and ignored `*.local.md` files. Treat `WEB.md` as a compatibility
   redirect for existing projects, not a companion to recommend for new setup.
10. If the existing generated block references `WEB.md`, recommend replacing it
   with the upstream Web remote reference during this run.
11. Inspect the repository for frontend evidence such as HTML, CSS, client-side
   JavaScript or TypeScript, frontend dependencies, or framework configuration.
   When present, recommend the published Modern Web Guidance skill as a remote
   reference:
   `Frontend web development=https://raw.githubusercontent.com/GoogleChrome/modern-web-guidance/main/skills/modern-web-guidance/SKILL.md`.
12. Inspect `package.json` and framework configuration files. If the project
   depends on `svelte` or `@sveltejs/kit`, or contains `svelte.config.*`,
   recommend the upstream Svelte agent instructions as a remote reference:
   `Svelte=https://svelte.dev/docs/ai/instructions/llms.txt`.
13. If `docs/agents/issue-tracker.md` exists, read it and recommend the
   `issue-tracker` companion regardless of which provider it configures. Do not
   recommend provider-specific companions for the same responsibility.
14. Recommend other companions only when justified by the repository or the
   user's stated workflow. Do not select every companion by default.
15. Ask the user to confirm the companion and remote-reference selection. Keep
   this to one concise question.
16. Preview the generated diff with `scripts/configure.py`. Never skip the
   preview when the target already contains project guidance.
17. Show the proposed generated section and ask the user to review it before
   writing.
18. After confirmation, run the script with `--write`.
19. Run the same command with `--check` and inspect `git diff --check`.
20. For a confirmed Svelte project, inspect the repository for an existing
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
    'Frontend web development=https://raw.githubusercontent.com/GoogleChrome/modern-web-guidance/main/skills/modern-web-guidance/SKILL.md' \
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
- Treat Matt Pocock's `## Agent skills` section and `docs/agents/` files as
  project-owned output outside this skill's generated block. Never overwrite or
  silently repair them.
- Stop if marker pairs are missing, duplicated, nested, or incomplete. Do not
  guess which content is generated.

## Companion Boundaries

Keep foundational instructions that apply to nearly every task in the inline
Way of Working. Keep conditional procedures in companions or current upstream
references. If either repeats generic scoping, editing, testing, or handoff
rules, move those rules to the shared source instead of generating both.

Project-specific commands, architecture, conventions, and exceptions stay
outside the generated block in the repository's `AGENTS.md`.

Matt Pocock's setup is optional and runs first only so its project-owned files
can inform companion selection in the same session. This skill must still work
when the user declines it or uses a different source for issue-tracker guidance.

The upstream Svelte instructions and the official Svelte MCP add-on have
separate jobs. The remote reference supplies current, agent-neutral working
instructions. `npx sv add mcp` owns the optional client-specific configuration
and must remain an explicit, reviewed project mutation.
