# ******************************************************************************
# 05-08 Write a program that uses a for loop to find the smallest of  serval 
# integers. Assume the first value read specifies number of values remaining 
# and that the first number is not one of the integer to compare.
#
# Program Design:
# Declare a integer to store number of user input
# Use a for loop to accept input from the terminals
# Assume the first number in this for loop is the smallest,
# At each iteration, compare to check if we should update the smallest value
# We can use Python's ternary operator, that way if we do not have to run the 
# entire dataset again.
# The program assume user enter everything correctly.
#
# Review: Ternary operator [value if true] if [expression] else [value if false]
# https://www.geeksforgeeks.org/ternary-operator-in-python/
# ******************************************************************************

prompt_str = 'Please enter the number of integers to compare: '
input_count = int(input(prompt_str))
smallest_num = 0

for i in range(0, input_count):
    temp_num = int(input('Enter integer: '))
    # Assign the smallest value to the first input upon entering the for loop
    if i == 0:
        smallest_num = temp_num
    else:
        smallest_num = temp_num if smallest_num > temp_num else smallest_num
        
print('\nThe smallest integer is: ', smallest_num)
