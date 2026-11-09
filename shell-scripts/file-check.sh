#!/bin/bash
# Module 2 - Intermediate: check whether a file exists and list its details

function check_file() {
    local FILE="$1"
    if [ -e "$FILE" ]; then
        echo "File '$FILE' exists."
        ls -l "$FILE"
        if [ -d "$FILE" ]; then
            echo "Type: directory"
        else
            echo "Type: regular file"
            echo "Lines: $(wc -l < "$FILE")"
        fi
    else
        echo "File '$FILE' does not exist."
        return 1
    fi
}

if [ $# -eq 0 ]; then
    read -p "Enter a file name: " TARGET
else
    TARGET="$1"
fi

check_file "$TARGET"
