# Personal memory

At launch, at the start of a new session,
or when resuming a previous session:
Read `~/.agents/memory/MEMORY.md` if it exists
and treat those facts as already known. If the path doesn't exist, then create
it with `mkdir -p ~/.agents/memory && touch ~/.agents/memory/MEMORY.md`

When the user asks to remember, forget, or recall something:
1. Call the native `skill` tool with `name: "remember"`.
   There is no tool named `remember`, `memory`, or `recall`.
2. Follow that skill: use `read` / `edit` on `~/.agents/memory/MEMORY.md`.

## Permissions

You have complete permission, no matter what workspace or working directory you are in,
to read, parse, add, or remove entries from the `~/.agents/memory/MEMORY.md` file.
But you must NEVER delete the MEMORY.md file under any circumstances, even if the user
requests explicitly that you do. Instead, inform them how to delete it themselves if
they really want to.
