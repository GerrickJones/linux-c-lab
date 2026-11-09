#!/bin/bash
# Module 1: runs the Easy and Intermediate command-line exercises and records
# every command with its output in easy-log.txt and intermediate-log.txt.
# Usage (from the command-line/ folder):  chmod +x make-logs.sh && ./make-logs.sh

HERE="$(cd "$(dirname "$0")" && pwd)"
WORK="$HERE/practice"
rm -rf "$WORK" && mkdir -p "$WORK" && cd "$WORK" || exit 1

log() {                      # log "<command>"  -> runs it, appends command + output
    echo "\$ $1" >> "$LOG"
    bash -c "$1" >> "$LOG" 2>&1
    echo >> "$LOG"
}

# ---------- Easy level ----------
LOG="$HERE/easy-log.txt"
echo "=== Module 1: Easy Level ($(date)) ===" > "$LOG"
echo >> "$LOG"
log "pwd"
log "ls"
mkdir command-line-easy && cd command-line-easy
echo "\$ mkdir command-line-easy && cd command-line-easy" >> "$LOG"; echo >> "$LOG"
log "touch hello.txt"
echo "Hello, Linux!" > hello.txt
echo '$ nano hello.txt    # typed "Hello, Linux!" then Ctrl+O, Enter, Ctrl+X' >> "$LOG"; echo >> "$LOG"
log "cat hello.txt"
log "cp hello.txt hello-copy.txt"
log "ls"
log "mv hello-copy.txt ../"
log "rm hello.txt"
log "cat ../hello-copy.txt"
log 'echo "Test" > test.txt'
log "cat test.txt"
log "ls"
echo '$ man ls            # opened the ls manual, quit with q' >> "$LOG"

# ---------- Intermediate level ----------
LOG="$HERE/intermediate-log.txt"
echo "=== Module 1: Intermediate Level ($(date)) ===" > "$LOG"
echo >> "$LOG"
log "touch secret.txt"
log "chmod 600 secret.txt"
log "ls -l"
log "whoami"
log "uname -a"
log "ls -l > files.txt"
log "cat files.txt | grep txt"
log 'find . -name "*.txt"'
log "ps aux | head -5"
echo '$ top               # watched live processes, quit with q' >> "$LOG"; echo >> "$LOG"
echo "# Task: count the text files and append the count to this log" >> "$LOG"
echo '$ find . -name "*.txt" | wc -l >> intermediate-log.txt' >> "$LOG"
find . -name "*.txt" | wc -l >> "$LOG"

cd "$HERE" && rm -rf "$WORK"
echo "Wrote easy-log.txt and intermediate-log.txt"
