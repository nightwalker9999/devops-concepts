#!/usr/bin/env bash


    function reverse_string_while_loop {
    #       1. Capture the input string
        local input_string="$1"
    #       2. Initialize the empty var
        local reversed=""
    #       3. Iterate over the string
        while IFS= read -r -n1 char; do
            reversed=$char$reversed
        done <<< "$input_string"
    #       4. print the reversed string
        echo "$reversed"
    }

    function reverse_string_for_loop {
    #       1. Capture the input string
        local input_string="$1"
    #       2. Initialize the empty var
        local reversed=""

    #       3. Iterate over the string
        for ((i=${#input_string}-1; i>=0; i--)); do
            reversed+="${input_string:i:1}"
        done
    #       4. print the reversed string
        echo "$reversed"
    }

   main () {
       reverse_string_for_loop "$@"


        
    }

main "$@" 

# ──────────────────────────────────────────────
# Day: 2
# Date: 2025-11-11
# Topic: String reversal using while & for loops
# Practice Platform: Online Bash Editor + Bats
# Problems Solved:
#   - Reverse string using while-read loop
#   - Reverse string using index-based for loop
# What I Learned:
#   - `while IFS= read -r -n1` safely preserves spaces and special chars.
#   - `for ((i=${#s}-1; i>=0; i--))` is a clean index loop for ASCII reversal.
#   - Substring extraction: `${var:pos:len}` → `${input_string:i:1}`.
#   - Input redirection `<<< "$var"` feeds a variable into stdin.
# Where I Struggled:
#   - Missed the here-string (`<<<`) once — loop got no input.
#   - Used the wrong variable name (`${s:i:1}`) — output went blank.
# Reflection:
#   - Small Bash details (quoting, variable naming, stdin feeding) decide everything.
#   - Both methods are useful: `while` for safe parsing, `for` for clean indexing.
# ──────────────────────────────────────────────
