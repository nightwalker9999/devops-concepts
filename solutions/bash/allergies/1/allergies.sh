#!/usr/bin/env bash

declare -A allergies_map=(
    [eggs]=1
    [peanuts]=2
    [shellfish]=4
    [strawberries]=8
    [tomatoes]=16
    [chocolate]=32
    [pollen]=64
    [cats]=128
)

allergies() {
    local score="$1"
    local command="$2"
    local item="$3"

    # ---------------------------------------------------------
    # MODE 1: allergic_to <item>
    # Example: allergies.sh 0 allergic_to peanuts
    # ---------------------------------------------------------
    if [[ "$command" == "allergic_to" ]]; then
        local value="${allergies_map[$item]}"

        if (( score & value )); then
            echo "true"
        else
            echo "false"
        fi
        return 0
    fi

    # ---------------------------------------------------------
    # MODE 2: list
    # Example: allergies.sh 34 list
    # ---------------------------------------------------------
if [[ "$command" == "list" ]]; then
    local result=""

    for allergen in eggs peanuts shellfish strawberries tomatoes chocolate pollen cats; do
        local value="${allergies_map[$allergen]}"

        if (( score & value )); then
            # Append allergen to result string
            if [[ -z "$result" ]]; then
                result="$allergen"
            else
                result="$result $allergen"
            fi
        fi
    done

    echo "$result"
    return 0
fi

}

main() {
    allergies "$@"
}

main "$@"

# ─────────────────────────────────────────────────────────────
# Day: 4
# Date: 2025-11-13
# Topic: Bitmask Logic + Branching + Bash Scripting (Allergies Problem)
#
# What I Learned:
#   - Allergy values (1,2,4,8,16,32,64,128) are powers of 2.
#   - Powers of 2 let us encode multiple allergies into one number.
#   - To check if an allergy is present: use bitwise AND → (( score & value )).
#       If the bit is ON → non-zero → person is allergic.
#       If OFF → zero → not allergic.
#   - Bash associative arrays map names to values cleanly:
#       allergies_map[eggs]=1
#   - Script has two modes:
#       1) allergic_to <item>  → output true/false
#       2) list                → output all allergies (one line, space-separated)
#   - Only known allergy values are checked, so unknown bits (256,512…) are ignored automatically.
#
# Where I Struggled:
#   - Understanding that Exercism calls the script with:
#         score command item
#       and NOT just score + allergen.
#   - Confusion due to branching structure and missing fi braces.
#   - Formatting output for the `list` mode into a single line.
#   - Bitwise AND syntax in Bash (( score & value )) was new and looked strange.
#   - Associative array syntax ${array[$key]} felt unfamiliar.
#
# Key Insights:
#   - Bitmask = checking which “switches” are ON inside a number.
#   - “allergic_to” mode → only check one bit.
#   - “list” mode → loop through all items, check bits one by one.
#   - Building output: start empty, append items with spaces.
#   - Bash errors mostly came from syntax (missing fi, wrong indexing).
#
# Reflection:
#   - This exercise pushed both logical thinking and Bash syntax at the same time.
#   - Passing all tests doesn’t equal feeling confident — but now I understand 
#     HOW and WHY the code works, not just copying a pattern.
#   - Slowly getting comfortable with Bash control flow, arrays, and bitwise  operations.
#   - Felt hard at first, but breaking it down into “switches” made it much easier.
# ─────────────────────────────────────────────────────────────
