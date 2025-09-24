age = 20

if age < 18: 
    print("Minor")
elif age < 60:
    print("Adult")
else: 
    print("Senior")


# Ternary (inline/if-else)
age = 20
status = "Adult" if age >= 18 else "Minor"
print(status)

