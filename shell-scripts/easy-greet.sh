#!/bin/bash
# Module 2 - Easy: hello world, variables, input, and the date

echo "Hello, Shell!"

NAME="Student"
echo "Hello, $NAME!"

read -p "Enter your name: " USERNAME
echo "Welcome, $USERNAME!"
echo "Today is $(date)"
