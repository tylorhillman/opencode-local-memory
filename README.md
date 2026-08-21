# Opencode Local Memory
---
I created this local memory skill because I didn't want to be tied
to another cloud based subscription model, and this works *good enough*

Please feel free to tweak this, rip it apart, do whatever to it.

## Installation
`git clone` this repo and then `cd` into it.
Then simply run
```bash
  ./install.sh
```
If you want to make it to where opencode doesn't ask you for permission every
single time it commits something to memory, then make sure to add
`"~/.agents/memory/**": "allow"` to your `opencode.json` config under the
permission section.
