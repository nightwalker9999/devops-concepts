#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#

    square_of_sum() {
    # Write logic for calculating square of sums
        local n="$1"
        local sum=0
        for (( i=1; i<=n; i++ )); do
            (( sum += i))
        done 

        echo $(( sum * sum ))
    }
        
    sum_of_squares() {
    # Write logic for calculating sum of squares
        local n="$1"
        local sum=0
        for (( i=1; i<=n; i++ )); do
            (( sum += i*i ))
        done

        echo "$sum"
    }
        
    difference() {
    # Write logic for calculating difference
        local n="$1"
        local s1
        local s2

        s1=$(square_of_sum "$n")
        s2=$(sum_of_squares "$n")

        echo $(( s1 - s2 ))
    }
    
   main () {
       local command="$1"
       local n="$2"

       case "$command" in
           square_of_sum)
               square_of_sum "$n"
               ;;
           sum_of_squares)
               sum_of_squares "$n"
               ;;
           difference)
               difference "$n"
               ;;
           *)
           echo "Unknown Command"
           exit 1
           ;;
       esac 
   }
#
#   # call main with all of the positional arguments
   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***
