#!/usr/bin/env bash
set -euo pipefail

AGENT_DIR="$HOME/.agents"
CONFIG_DIR="$HOME/.config"
OPENCODE_DIR="$CONFIG_DIR/opencode"

MEMORY_DIR="$AGENT_DIR/memory"
SKILL_DIR="$AGENT_DIR/skills"
REMEMBER_DIR="$SKILL_DIR/remember"
CMD_DIR="$OPENCODE_DIR/commands"

REPO_DIR="."
REPO_SRC_DIR="$REPO_DIR/src"

SRC_MEMORY_FILE="$REPO_SRC_DIR/MEMORY.md"
SRC_SKILL_FILE="$REPO_SRC_DIR/SKILL.md"
SRC_AGENT_FILE="$REPO_SRC_DIR/AGENTS.md"
SRC_CMD_FILE="$REPO_SRC_DIR/remember.md"

echo -e "[+++] - INSTALLING opencode-memory\n"
mkdir -p "$MEMORY_DIR"
cp "$SRC_MEMORY_FILE" "$MEMORY_DIR/"
echo -e "[+] - Opencode memory wrote to\t__\n\t\t\t\t  \\__ $MEMORY_DIR"


mkdir -p "$REMEMBER_DIR"
cp "$SRC_SKILL_FILE" "$REMEMBER_DIR/"
echo -e "[+] - SKILL.md file wrote to\t__\n\t\t\t\t  \\__ $REMEMBER_DIR"


mkdir -p "$CMD_DIR"
cp "$SRC_CMD_FILE" "$CMD_DIR/"
echo -e "[+] - remember.md file wrote to\t__\n\t\t\t\t  \\__ $CMD_DIR" 


cp "$SRC_AGENT_FILE" "$OPENCODE_DIR"
echo -e "[+] - AGENTS.md file wrote to\t__\n\t\t\t\t  \\__ $OPENCODE_DIR"
echo -e "\n[+++] - Done! Run a new opencode instance to start!\n"
echo -e "Be sure to add the following to\n$OPENCODE_DIR/opencode.json under\nthe \"permission\" section:\n\n\"edit\": {\n  \"~/.agents/memory/**\": \"allow\"\n}"
