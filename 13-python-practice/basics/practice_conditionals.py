'''
Even or Odd
Ask user for a number (input()), print "Even" if divisible by 2, else "Odd".
'''

#num = int(input("Enter a number: "))


# #Normal Conditional
# if num % 2 == 0:
#     print("Even")
# else: 
#     print("Odd")

# #Ternary Style
# odd_or_even = "Even" if num % 2 == 0 else "Odd"
# print(odd_or_even)

'''
Max of two numbers
Given a = 10, b = 42, print the larger using both normal if/else and a ternary.
'''

# a, b = 10, 42

# # Normal conditional
# if a>b:
#     print(a)
# else:
#     print(b)

# # Ternary Operator (Inline/ if-else)
# larger = a if a>b else b
# print(larger)

'''
FizzBuzz (mini version)
For numbers 1–15:

Print "Fizz" if divisible by 3,

"Buzz" if divisible by 5,

"FizzBuzz" if both,

Otherwise the number itself.
(Loop + conditionals together)
'''

for num in range(1,16):
    if num % 3 == 0 and num % 5 == 0:
        print("FizzBuzz")
    elif num % 3 == 0:
        print("Fizz")
    elif num % 5 == 0:
        print("Buzz")
    else:
        print(num)
