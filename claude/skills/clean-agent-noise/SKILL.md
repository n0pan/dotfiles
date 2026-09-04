---
name: clean-agent-noise
description: Aggressively delete the noise a coding agent leaves behind — explanatory and narration comments, design rationale, changelog-in-code ("// Added this to fix..."), redundant docstrings, debug prints, commented-out code, dead scaffolding, stray backup/scratch files — without changing behavior. Deletes most comments outright rather than shortening them, keeping only the load-bearing few. Use when the user says code is over-commented or full of AI slop, asks to clean up / tidy / deslop agent output, or wants agent-written changes made presentable before review or a PR.
---

# Clean agent noise

Coding agents over-explain. They narrate what the code already says, annotate their own edit history in comments, leave debug scaffolding behind, and add abstractions nobody asked for. This skill removes that residue so the diff reads like a human wrote it.

**The one hard rule: this is a delete-only, behavior-preserving pass.** Removing a comment cannot break a program; removing a line of code can. If a cleanup would change what the code *does*, it is out of scope — note it in the report and leave it alone.

**The default is deletion.** Most comments an agent writes should not survive this pass — not be shortened, not be sharpened, *not survive*. Keeping one is the exception, and every survivor has to clear the bar in §3. If you finish a file having kept most of what you read, you have not done this pass; you have proofread it.

## 1. Establish scope

Never clean files the agent didn't touch. Cleaning a whole repo of pre-existing human comments is a different, unasked-for task.

In priority order:

1. The user named files or a directory → use exactly that.
2. Uncommitted work → `git status --short` and `git diff` (plus `git diff --cached`).
3. A branch of agent work → `git diff $(git merge-base HEAD main)...HEAD --stat` (try `main`, then `master`, then the repo's default).
4. Not a git repo, nothing specified → ask which files, or fall back to the files touched this session.

Read the diff, not just the file list. A file with two changed lines gets those two lines examined, not a full-file comment purge — unless the user explicitly asks to clean the whole file.

## 2. Remove

**Explanatory comments that don't clear §3.** The largest category by volume, and the one most often left behind, because these are *true* and often well written. Design rationale, a summary of what the function does, context about what some other system sends, a justification of the approach taken. Genuine engineering thought in the wrong medium — it belongs in the PR description or the commit message, not above the code forever. Delete these on the same reflex as narration.

**Narration.** Comments that restate the next line.

```js
// Loop through the users          ← delete
for (const user of users) {
  // Increment the counter          ← delete
  count++;
}
```

**Changelog-in-code.** Anything addressed to the reviewer instead of the reader. `// Added this to fix the null crash`, `// CHANGED: now uses async`, `// NEW`, `// Updated per your request`, `// This replaces the old implementation`, `// Note: I removed the try/catch here`. Git history holds this; the source file should not.

**Redundant docs.** Docstrings and JSDoc that only re-type the signature:

```python
def get_user(user_id: str) -> User:
    """Get a user.                  ← delete the whole block

    Args:
        user_id: The user id.
    Returns:
        The user.
    """
```

Keep the docstring only if it clears §3 — a constraint, a raise, a unit, an ownership rule. Prose that merely describes what the function does goes with the boilerplate.

**Section banners and decoration.** `// ===== HELPERS =====`, `# ---------- MAIN ----------`, ASCII dividers, emoji headers — unless the file already uses them consistently as its own convention.

**Tutorial comments.** Explanations of the language or stdlib to a reader who obviously knows it: `// useState returns a value and a setter`, `# dict comprehension`, `// async/await here so we don't block`.

**Debug scaffolding.** `console.log`/`print`/`fmt.Println`/`dbg!` added for tracing, `debugger` statements, temporary timing instrumentation. Distinguish from real logging: a `logger.info` with a stable message inside an error path is production code; `console.log('here 3', data)` is not.

**Commented-out code.** Dead blocks the agent left "in case", including old implementations parked above the new one.

**Self-addressed TODOs.** `// TODO: maybe refactor this later`, `// TODO: add tests`, `// FIXME: not sure if this is right`. A TODO with a ticket reference or a concrete, real follow-up stays.

**Dead scaffolding introduced by the agent.** Unused imports, variables assigned and never read, helper functions with zero call sites, parameters threaded through and ignored, single-use wrapper functions that only forward, config flags with exactly one possible value. Verify zero references before deleting — grep the repo, don't assume; watch for dynamic access (reflection, string-keyed lookup, DI containers, test fixtures, public API surface).

**Over-decorated output.** Emoji and checkmark garnish in log lines, CLI output, and commit-adjacent strings when the surrounding code doesn't use them. `✅ Successfully completed!` → `Done` or nothing.

**Stray files.** `*.bak`, `*_old.*`, `*_v2.*`, `foo copy.py`, scratch scripts at the repo root, one-off verification scripts, and unrequested `CHANGELOG.md` / `SUMMARY.md` / `IMPLEMENTATION_NOTES.md` files the agent wrote about its own work. Confirm with the user before deleting any file — that is not a delete-only comment edit.

**Formatting residue.** Runs of blank lines the agent inserted, trailing whitespace, indentation that fights the surrounding file.

## 3. The bar for keeping a comment

A comment survives only if deleting it would cost a competent reader real time, or let them break something. Apply the test literally, one comment at a time:

> **Delete it, then ask: what breaks?** If the answer is "nothing — the reader just knows less about my reasoning", it goes.

**Survives — the comment is load-bearing:**

- **Landmines.** Code that looks wrong but is right, and that someone will "fix" and break: a forced reflow, a deliberately omitted `await`, an ordering requirement, a race, a workaround for a bug in someone else's code. `// reflow, or the width change does not animate` earns its line.
- **Facts not recoverable from the code or the repo.** A magic number's provenance, a wire-protocol quirk, a hardware limitation, a vendor bug, a link to the issue or spec that forced this shape.
- **Contracts a caller must uphold.** A unit, an invariant, "must be called before X", "not thread-safe", a documented raise.
- **Directives.** `# type: ignore`, `# noqa`, `eslint-disable`, `@ts-expect-error`, `//go:build`, `# pragma`, `# pylint:`, coverage markers. These are code, not comments.
- **License and copyright headers**, and **generated-file markers** (`// Code generated by ... DO NOT EDIT.` — don't hand-edit those files at all).
- **The project's own documented-API convention** — public doc comments in a codebase that documents its public API.

**Out of scope — never examined against the bar at all:**

- **Human-written comments predating the agent's work.** Not this skill's business, however verbose. Check `git blame` when provenance is unclear.
- **Tests.** Test cases and assertions always stay. Comments the agent added inside tests do face the bar.

**Goes — true, well written, and still noise:**

- **Design rationale.** Why this shape was chosen over an alternative that isn't in the code.
- **Anything a reader learns by reading the next five lines** — including elegant summaries of what a function does.
- **Restatements of the type system.** `// null when there is no limit` above `: number | null`.
- **Context about other systems** that doesn't change how you would edit *this* code: what the backend decides, what the payload already contains, who owns the schema.
- **Justifications addressed to a reviewer** rather than to a future reader.

When in doubt, **delete**. A wrongly deleted comment costs one reader a few minutes once; a wrongly kept one taxes every reader forever — and the text is still in git either way.

Calibration: expect to delete most of what you examine. Of the comments *the agent added*, zero survivors in a file is a normal, good outcome and two or three is typical; keeping most of them means you ran the wrong pass. This is a count of the comments in scope — pre-existing human comments are not yours to delete and do not enter the tally.

### Deleting is the only move

Do not shorten a comment. Do not merge three into one. Do not compress an essay into a crisp sentence. That is rewriting, and it preserves exactly the noise the user asked you to remove, in tidier prose. The question is never "how do I say this in fewer words" — it is "does this earn a line at all". Yes, and it stays **exactly as written**; no, and it goes **entirely**. There is no middle setting.

One exception: a comment that clears the bar but is factually *wrong* — stale after the code moved under it — gets corrected, because a lying comment is worse than no comment. Flag every such correction in the report.

## 4. House style is a ceiling, not a floor

Read two or three untouched neighbouring files, but read them to find the *most* this codebase tolerates — never as a licence to keep a comment that failed §3. "The file next door explains every block" is not a reason to keep yours. Density is not the target; the bar is. The result should be a file at or below the local norm, never above it.

Two things genuinely override these defaults: a `CLAUDE.md` or style guide with explicit comment rules, and lint config that *requires* doc comments on certain symbols.

## 5. Workflow

1. Establish scope (§1) and read the diff.
2. Skim 2–3 untouched files nearby to find the ceiling on comment density (§4).
3. Pass one — comments and formatting. Walk them one at a time, apply §3's delete-and-ask test to each, and delete whole. Pure deletions, zero risk.
4. Pass two — dead code. Grep for references before each removal. Skip anything ambiguous.
5. Pass three — stray files. List them and ask before deleting.
6. Verify (§6).
7. Report (§7).

Two passes, not one edit-everything sweep: it keeps the risky changes separated from the risk-free ones, so a verification failure points straight at pass two.

Use `references/detection.md` for ready-made ripgrep patterns that surface candidates fast.

## 6. Verify

Non-negotiable, because "delete-only" is a claim that has to be checked:

- Run the project's existing checks — tests, typecheck, lint, build. Whatever the repo already uses; don't invent new ones.
- Re-read `git diff` end to end. Every hunk should be a deletion or a whitespace change. **Any line that adds or modifies executable code is a bug in this pass** — revert it.
- **Check for rewrites.** A hunk that deletes a comment and adds a shorter one in its place is the §3 failure mode, not a cleanup. Unless it is the stale-comment exception, revert the addition and delete the comment outright.
- If the language is whitespace-sensitive (Python, YAML), confirm removed comment lines didn't disturb a block.
- If you deleted a symbol, confirm the grep for it is now empty.

If checks were already failing before the cleanup, say so rather than claiming the pass broke or fixed them.

## 7. Report

Short and factual:

- Files touched, lines removed.
- Counts by category ("14 explanatory comments, 11 narration, 3 debug prints, 1 unused import").
- **Comments deleted vs. kept** among those in scope, and for each survivor, one clause naming which §3 rule saved it. If you cannot name the rule, you should have deleted it. A long list of survivors is a finding about the pass, not a feature of it.
- Any comment you rewrote rather than deleted, and why it was the stale-comment exception.
- What verification ran and its result.
- Anything deliberately left: dead code with ambiguous references, files awaiting the user's go-ahead to delete.
- Behavior-affecting problems spotted along the way — reported, not fixed. That's a separate task.

Never commit. Leave the cleanup in the working tree for review.
