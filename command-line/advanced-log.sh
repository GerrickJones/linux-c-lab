#!/bin/bash
# Module 1 - Advanced task: automate a directory listing into advanced-log.txt
LOG="advanced-log.txt"
TARGET="${1:-..}"
{
    echo "=== Directory listing of $TARGET on $(date) ==="
    echo "\$ ls -l $TARGET"
    ls -l "$TARGET"
    echo
    echo "\$ tree $TARGET"
    if command -v tree >/dev/null; then tree "$TARGET"; else echo "(tree not installed: sudo apt install tree)"; fi
    echo
    echo "\$ alias ll='ls -l'"
    echo "\$ env | grep PATH"
    env | grep "^PATH="
    echo
} > "$LOG"
echo "Wrote $LOG"
