#!/bin/bash
# Integration project: compile and run contacts.c, back up the C programs, log the run

cd "$(dirname "$0")" || exit 1

gcc -g ../c-programs/contacts.c -o contacts || { echo "Compile failed"; exit 1; }
./contacts
(cd .. && tar -czf shell-scripts/contacts-backup.tar.gz c-programs/*.c)
echo "Output logged at $(date)" >> project-log.txt
echo "Backup created: contacts-backup.tar.gz"
