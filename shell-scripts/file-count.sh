#!/bin/bash
# Module 2 - Advanced: count files by type in a directory and log the results

trap 'echo "Error! Something went wrong on line $LINENO."' ERR

DIR="${1:-.}"
LOG="file-count-log.txt"

if [ ! -d "$DIR" ]; then
    echo "Error: '$DIR' is not a directory."
    exit 1
fi

declare -A COUNTS
for f in "$DIR"/*; do
    [ -f "$f" ] || continue
    base=$(basename "$f")
    if [[ "$base" == *.* ]]; then
        ext="${base##*.}"
    else
        ext="(no extension)"
    fi
    COUNTS["$ext"]=$(( ${COUNTS["$ext"]:-0} + 1 ))
done

{
    echo "File count for '$DIR' on $(date)"
    if [ ${#COUNTS[@]} -eq 0 ]; then
        echo "  No files found."
    else
        for ext in "${!COUNTS[@]}"; do
            printf "  %-16s %d\n" "$ext" "${COUNTS[$ext]}"
        done | sort
    fi
    echo
} | tee -a "$LOG"

echo "Results appended to $LOG"
