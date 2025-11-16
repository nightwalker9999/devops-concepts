#!/usr/bin/env bash


   checkArmstrongNumber() {
       local num="$1"
       local original="$num"
       
       #1. Count Digits
       local digits=0
       local temp="$num"

       while (( temp>0 )); do
           (( temp/=10 ))
           (( digits++ )) 
       done

       #2. Extract digits & Raise to power
       local sum=0
       temp="$num"

       while (( temp>0 )); do
           local digit=$(( temp%10 ))
           local power=$(( digit**digits))
           (( sum+=power))
           (( temp/=10 ))
       done

       #3. Compare with original
       if ((sum == original)); then
           echo "true"
       else
           echo "false"
       fi
   }

   main () {

       checkArmstrongNumber "$1"
   }

   main "$@"

# ─────────────────────────────────────────────────────────────
# Day: 5
# Date: 2025-11-16
# Topic: Armstrong Number Logic in Bash (Digit Extraction + Exponentiation)
#
# What I Learned:
#   - Armstrong Number = sum of each digit raised to the power of total digits.
#       Example: 153 → 1³ + 5³ + 3³ = 153 → true.
#   - To extract digits from a number:
#         digit = n % 10        → gives last digit
#         n = n / 10            → removes last digit
#     Repeating this digs through the entire number.
#   - To count digits, keep dividing the number by 10 until it becomes 0.
#         while (( temp > 0 )); do digits++; temp/=10; done
#   - Bash can raise numbers to a power using the ** operator:
#         (( power = digit ** digits ))
#   - Summing powers and comparing to the original number determines if it’s Armstrong.
#
# Where I Struggled:
#   - Understanding how to “dissect” a number into digits.
#   - Confusion about modulo (%) and division (/) working together.
#   - Unsure how to perform exponentiation in Bash.
#   - Initially unclear how the entire while-loop structure works.
#
# Key Insights:
#   - Modulo (%) always gives last digit, division removes it → very powerful pattern.
#   - Logic makes more sense when broken into steps: count → extract → power → sum.
#   - Bash arithmetic inside (( )) behaves like C-style integer arithmetic.
#   - Practicing small math logic problems improves Bash confidence very fast.
#
# Reflection:
#   - This exercise helped strengthen my “logic building” mindset in Bash.
#   - Learning to use % and / loops finally made the digit-processing concept click.
#   - Calculating powers and summing them felt intimidating before, but now it feels natural.
#   - I can see how practicing these types of problems daily is improving my Bash thinking.
# ─────────────────────────────────────────────────────────────

