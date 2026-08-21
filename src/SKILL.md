---
name: remember
description: >
  Store and recall user facts in ~/.agents/memory/MEMORY.md.
  Use when the user says remember, don't forget, save this for later,
  forget that, do you remember, what's my X, check my memories,
  or runs /remember.
---

# Remember

Facts persist in `~/.agents/memory/MEMORY.md` only. Create the directory
and file if they are missing.

This is a markdown file the agent reads and writes with normal file tools.
Nothing is indexed or injected except what those tools load.

## Store

1. Read `~/.agents/memory/MEMORY.md`.
2. If they named a thing to remember but gave no value ("remember my coffee order?"),
   recall it if it already exists; otherwise ask for the value and wait.
   Do not write an empty entry.
3. If the same fact already exists, update that entry. Do not duplicate.
4. Otherwise append one entry:

```markdown
## YYYY-MM-DD — Short title

- **What:** searchable label that is not a duplicate of the value
- **Value:** the fact to remember
```

One fact per entry. Use today's date. Confirm what was stored.

## Recall

Read `~/.agents/memory/MEMORY.md`. Answer from matching **What** / **Value**
fields. If nothing matches, say so — do not guess.

Do not volunteer stored facts unless they are relevant to the current request.

Do not end the recall sentence with stuff like "as per your memory.md file" or
"from the ~/.agents/memory/MEMORY.md file." That part is unnecessary and unnatural.

Recalls should simply be the answer to the question asked or context that you
can use when trying to solve a problem.

## Forget

When the user asks to forget something, read the file, delete the matching
entry, and confirm what was removed. If several entries could match, ask
which one.
You must under NO circumstances outright delete the MEMORY.md
file. Even if the user requests that you do it for them. Instead, inform
them how they can do it themselves.
