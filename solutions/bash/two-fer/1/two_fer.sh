#!/usr/bin/env bash

   two_fer (){
       local name="$1"

       if [ -n "$name" ]; then
           echo "One for $name, one for me."
       else
           echo "One for you, one for me." 
       fi
   }

   main () {
        two_fer "$1"
   }

   main "$@"

# ──────────────────────────────────────────────
# Day: 3
# Date: 2025-11-13
# Topic: Understanding $1, "$@", "$*" in Bash (Two-Fer Exercise)
#
# What I Learned:
#   - $1 gives only the *first* argument exactly as passed.
#   - "$@" expands to all arguments, but each one remains separate.
#     Perfect for loops or forwarding args safely.
#   - "$*" expands to all arguments *merged into one string*,
#     joined by IFS (default: space).
#   - Quoting is critical: "$@" ≠ $@, "$*" ≠ $*.
#   - The Two-Fer exercise expects only the first argument to be used.
#     Therefore, using $1 in both main() and inside the function is correct.
#
# Where I Struggled:
#   - I mistakenly used "$*" and "$@" which merged arguments or split them,
#     causing multi-word names to break test case 4.
#   - Passing "$*" from main() and then again using "$*" inside the function
#     combined multiple arguments ("John Smith" + "Mary Ann").
#   - Incorrect understanding of argument expansion caused confusing failures.
#
# Key Commands / Concepts:
#   - $1   → first argument only
#   - "$@" → all args kept as separate items
#   - "$*" → all args merged into a single string
#   - [ -n "$var" ] to check non-empty strings
#
# Reflection:
#   - Small Bash differences in quoting and parameter expansion completely
#     change behavior. Understanding $1, "$@", and "$*" is essential for
#     predictable scripting. Now the logic behind why tests passed or failed
#     makes complete sense.
# ──────────────────────────────────────────────

