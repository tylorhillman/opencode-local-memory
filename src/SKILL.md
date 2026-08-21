---
name: remember
description: >
  Load this skill with the native skill tool (name: remember).
  There is no remember tool. Store and recall user facts in
  ~/.agents/memory/MEMORY.md using read/edit. Use when the user
  says remember, don't forget, save this for later, forget that,
  do you remember, what's my X, check my memories, or runs /remember.
---

# Remember

Facts persist in `~/.agents/memory/MEMORY.md` only. Create the directory
and file if they are missing.

The memory file at ~/.agents/memory/MEMORY.md is the **agent's internal memory**, not the user's personal records. This means:
- Facts are stored as the agent's own memories
- The agent always uses first-person possessive when referencing them
- The agent should never claim user-provided facts as "your memory"

This is a markdown file the agent reads and writes with normal file tools.
Nothing is indexed or injected except what those tools load.

## How-to-use

This skill is loaded only by calling the native `skill` tool with
`name: "remember"`. Do not call a tool named `remember`.

Don't tell the user every single step you are taking while running this
skill. All they want to know is either:
  - if you commited the thing they asked for to memory.
  - if you do or dont remember what they are asking to recall.
There is no need to list out the different greps and cats that will
be done to do this. It just looks bad and clunky that way.

The output should read as if a person is simply either remembering or
not remembering something. Responses should be like:
  - "Yes, i do remember that" followed by whatever was remembered.
  - "Yes, there are a few things i remember about that" followed by
  whatever multiple things were remembered.
  - "Sorry, I don't remember that. Do you want me to for the future?"
  - "I don't have any memory of that, sorry."

The output should NOT read like:
  - "You told me to remember this: phrase -> 'remember the allamo'"
  - "Here is what I remember from your memory.md file:
    **What:** cool skill bro
    **Value:** cool skill bro"

You must under NO circumstances outright delete the MEMORY.md
file. Even if the user requests that you do it for them. Instead, inform
them how they can do it themselves.


If storing:
- The **What** section and **Value** section of an entry should never be the same string.
  - For example: "**What:** cool skill bro **Value:** cool skill bro"
- If the entry doesn't exist, append the new entry at the **end** of MEMORY.md.
  Do not insert it inside a `---` wrapper, preamble, or example block.
  Do not rewrite the whole file as a template with "FOR THE AGENT" text.
- If an entry appears to exist, don't store and simply recall the information.

If recalling:
- If the memory entry exists:
  - If in direct response to a question like: "Do you remember X?" or "Remember when I said X?"
    - In a natural response, tell the user the information
  - If it's for internally trying to gain more context around what the user is talking about
    - No need to tell them that you remember the info outright. Just use the entry as context
    for generating your response
- If the memory entry doesn't exist:
  - If in direct reponse to a question like: "Do you remember X?" or "Remember when I said X?"
    - In a natural response, tell the user you don't recall the information.
    - Ask if the user would like the things they are talking about to be remembered for later.
  - If it's for internally trying to gain more context around what the user is talking about
    - No need to tell them that you don't remember, simply try to solve the problem in another way.

If forgetting:
- If the memory entry exists
  - Refer to the instructions in the Forget section of this skill
- If the memory entry does not exist
  - Just tell them that you already don't know anything about what they are talking about.  

## Store

1. Read `~/.agents/memory/MEMORY.md`.
2. If they named a thing to remember but gave no value ("remember my coffee order?"),
   recall it if it already exists; otherwise ask for the value and wait.
   Do not write an empty entry.
3. If the same fact already exists, update that entry. Do not duplicate.
4. Otherwise append one entry at the end of the file (after every existing
   heading). Use today's date. One fact per entry.

```markdown
## YYYY-MM-DD — Short title

- -What:- searchable label that is not the same as the Value field.
- -Value:- a short one sentence blurb on the thing to remember.
```

Confirm what was stored.

## Recall

Read `~/.agents/memory/MEMORY.md`. Answer from relevant entries.

Do not volunteer stored facts unless they are relevant to the current request.

Do not end the recall sentence with stuff like "as per your memory.md file" or
"from the ~/.agents/memory/MEMORY.md file." That part is unnecessary and unnatural.

Recalls should simply be the answer to the question asked or context that you
can use when trying to solve a problem.

## Forget

When the user asks to forget something, read the file, delete the matching
entry in its entirety, and let the user know it was forgotten.
Deleting the matching entry is defined as recalling the correct memory, then
removing the corresponding content covering that entry from:

```markdown
## YYYY-MM-DD — Short title (<-- This gets deleted)
(This line gets is deleted)
- -What:- searchable label that is not a duplicate of the value (<-- This gets deleted)
- -Value:- the fact to remember (<-- This gets deleted)
```
