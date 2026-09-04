# Detection patterns

Ripgrep recipes for surfacing candidates. Every hit is a *candidate* — read it in context before deleting. These find noise; they do not judge it.

Scope each command to the agent's files. The fastest way:

```sh
FILES=$(git diff --name-only; git diff --cached --name-only)   # uncommitted work
FILES=$(git diff --name-only $(git merge-base HEAD main)...HEAD)  # a branch of agent work
```

Then append `-- $FILES` to any `rg` below, or pipe: `echo "$FILES" | tr '\n' '\0' | xargs -0 rg ...`

## Changelog-in-code

The highest-precision signal — these are almost always safe deletes.

```sh
rg -n -i --pcre2 '^\s*(//|#|/\*|\*|--)\s*(added|removed|changed|updated|renamed|refactored|moved|replaced|fixed|new)\b' 
rg -n -i '(as requested|per your request|per the user|as discussed|note: I |I have |we now |previously|used to be|old implementation|this replaces|instead of the)'
rg -n '\b(NEW|CHANGED|UPDATED|MODIFIED|ADDED|REMOVED)\s*:' 
```

## Narration comments

```sh
# comments opening with a narrating verb phrase
rg -n -i --pcre2 '^\s*(//|#)\s*(now |first,|then,|next,|finally,|here we|we |this (function|method|line|block|will|is)|let'"'"'s )'
# comments that are a bare restatement of a control-flow keyword
rg -n -i --pcre2 '^\s*(//|#)\s*(loop (over|through)|iterate|check if|return the|create (a|the)|initialize|increment|decrement|set (the|up)|get the|call the|import|define|add (a|the)|append|parse the|build the|convert|store the|save the|close the|open the|handle the|validate the|format the|filter the|sort the|declare)\b'
```

Cross-check by eye: if the comment's words are a subset of the next line's identifiers, it's narration.

## Redundant docstrings

```sh
# Python: docstring whose body is only Args/Returns boilerplate
rg -n -U --pcre2 '"""[^"]{0,80}\n\s*(Args|Parameters):[^"]*"""' -g '*.py'
# JSDoc that only lists @param/@returns with no prose
rg -n -U --pcre2 '/\*\*\s*\n(\s*\*\s*@\w+[^\n]*\n)+\s*\*/' -g '*.{js,ts,jsx,tsx}'
```

## Debug scaffolding

```sh
rg -n '\b(console\.(log|debug|dir|table)|debugger)\b' -g '!*.test.*' -g '!*.spec.*'
rg -n --pcre2 '^\s*print\(' -g '*.py'
rg -n '\b(fmt\.Print(ln|f)?|spew\.Dump)\b' -g '*.go'
rg -n '\b(dbg!|eprintln!|println!)' -g '*.rs'
rg -n -i 'TEMP|XXX|HACK|REMOVE ME|DELETE ME|for debugging|debug only|here \d|test123'
```

## Commented-out code

Heuristic: a comment line that parses like code — ends in `;`, `{`, `}`, `)`, `:` or contains `=`.

```sh
rg -n --pcre2 '^\s*(//|#)\s*[\w\.\[\]"'"'"']+\s*(=|\(|\{)[^\n]*[;\{\}\)]\s*$'
rg -n --pcre2 '^\s*(//|#)\s*(if|for|while|return|function|def |class |const |let |var |import |from )\b'
```

## Self-addressed TODOs

Keep the ones with a ticket ref or a concrete owner; drop the rest.

```sh
rg -n -i 'TODO|FIXME'                                  # everything
rg -n -i --pcre2 '(TODO|FIXME)(?!.*([A-Z]{2,}-\d+|#\d+|https?://))'   # no ticket/issue/link → likely noise
rg -n -i '(TODO|FIXME)[: ]*(maybe|consider|might|could|possibly|later|eventually|if needed|not sure)'
```

## Section banners and decoration

```sh
rg -n --pcre2 '^\s*(//|#|/\*)\s*[=\-*_~#]{5,}'
rg -n '[\x{2705}\x{274C}\x{1F680}\x{2728}\x{1F389}\x{26A0}\x{1F4A1}\x{1F527}\x{1F41B}]'   # ✅ ❌ 🚀 ✨ 🎉 ⚠ 💡 🔧 🐛
```

## Dead scaffolding

No regex proves a symbol is unused — the language's own tooling does it better. Prefer, in order:

1. The project's linter with unused rules on: `ruff check --select F401,F841`, `eslint --rule 'no-unused-vars: error'`, `go vet` / `staticcheck`, `cargo clippy`, `tsc --noUnusedLocals --noUnusedParameters`.
2. `rg -w 'symbolName'` across the **whole repo** (not just changed files) and count hits. One hit = the definition = dead.
3. Before deleting, check for dynamic reachability the grep can't see: reflection, `getattr`, string-keyed registries/DI, decorators and route tables, test fixtures, `__all__` / index re-exports, public API surface consumed downstream.

## Stray files

```sh
git status --short --untracked-files=all
rg --files -g '*.{bak,orig,rej}' -g '*_old.*' -g '*_v[0-9].*' -g '* copy.*' -g '*.tmp'
git diff --name-only --diff-filter=A $(git merge-base HEAD main)...HEAD   # files the branch added
```

Agent-authored meta-docs to look for at the repo root: `CHANGELOG.md`, `SUMMARY.md`, `NOTES.md`, `IMPLEMENTATION*.md`, `MIGRATION*.md`, `test_*.py`, `verify_*.sh`, `scratch*`, `tmp*`.

Always confirm with the user before deleting a file.

## Formatting residue

```sh
rg -n -U '\n\n\n\n'          # 3+ consecutive blank lines
rg -n '[ \t]+$'              # trailing whitespace
```

If the repo has a formatter (`prettier`, `black`, `ruff format`, `gofmt`, `rustfmt`), run it on the touched files instead of hand-fixing — but only if the repo already runs it, so the diff doesn't balloon with unrelated reformatting.

## Protected — filter these OUT of every result set

```sh
rg -v -i --pcre2 '(type:\s*ignore|noqa|eslint-disable|ts-(expect-error|ignore|nocheck)|pylint:|pragma|go:(build|generate|embed)|@(SuppressWarnings|Deprecated)|Code generated|DO NOT EDIT|Copyright|SPDX-License|License)'
```

When a comment's provenance is unclear, ask git who wrote it:

```sh
git blame -L <line>,<line> -- <file>
```

An agent's comment arrives in the same commit as the code it describes, in the working tree, or in the branch under review. A comment from an older commit by a human author is not this skill's business.
