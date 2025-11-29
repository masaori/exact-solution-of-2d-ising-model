
import sympy
from sympy import symbols, exp, sqrt, I, cos, sin, cosh, sinh, simplify, expand

K1, K2, theta = symbols('K1 K2 theta')
# Define the original expression from the text before the expansion
# Numerator part inside the sqrt (without the sqrt(-1) cancellation which is correct)
# The expression is:
# (cosh(2 K_1) cos(theta_(mu)) - sqrt(-1) sin(theta_(mu)) - sinh(2 K_1) cosh(2 K_2))
# multiplied by e^(i theta)

term_num = cosh(2*K1) * cos(theta) - I * sin(theta) - sinh(2*K1) * cosh(2*K2)
expr_num = exp(I*theta) * term_num

# Expand in terms of exponentials
# We want to see if it matches the user's expansion
# User's expansion (corrected with factor 2? or as is?)
# User's expansion as written in code (without factor 2):
# (e^(2 K_1) + e^(-2 K_1)) (e^(i theta) + e^(-i theta)) - (e^(i theta) - e^(-i theta)) - (e^(2 K_1) - e^(-2 K_1)) (e^(2 K_2) + e^(-2 K_2))
# All multiplied by e^(i theta) and divided by 4 (since they removed /2 and /4 factors)

# Let's construct the user's expanded form (multiplied by 4 to match the "cleared fraction" form)
# Note: The user has 1/4 factor outside effectively if they just dropped denominators?
# No, they are inside a fraction N/D. If they multiply N and D by 4, the ratio is unchanged.
# So we compare 4 * expr_num with the user's expanded numerator.

# User's numerator term (inside the outer e^(i theta)):
# (e^(2 K_1) + e^(-2 K_1)) (e^(i theta) + e^(-i theta)) - (e^(i theta) - e^(-i theta)) - (e^(2 K_1) - e^(-2 K_1)) (e^(2 K_2) + e^(-2 K_2))

e_2k1 = exp(2*K1)
e_m2k1 = exp(-2*K1)
e_2k2 = exp(2*K2)
e_m2k2 = exp(-2*K2)
e_it = exp(I*theta)
e_mit = exp(-I*theta)

user_inner_num = (e_2k1 + e_m2k1)*(e_it + e_mit) - (e_it - e_mit) - (e_2k1 - e_m2k1)*(e_2k2 + e_m2k2)
user_num = e_it * user_inner_num

# Correct inner numerator (multiplied by 4)
# 4 * [ (cosh(2K1)cos(theta) - i sin(theta) - sinh(2K1)cosh(2K2)) ]
# cosh(2K1) = (e_2k1 + e_m2k1)/2
# cos(theta) = (e_it + e_mit)/2
# i sin(theta) = (e_it - e_mit)/2
# sinh(2K1) = (e_2k1 - e_m2k1)/2
# cosh(2K2) = (e_2k2 + e_m2k2)/2

# 4 * [ (e_2k1 + e_m2k1)/2 * (e_it + e_mit)/2 - (e_it - e_mit)/2 - (e_2k1 - e_m2k1)/2 * (e_2k2 + e_m2k2)/2 ]
# = (e_2k1 + e_m2k1)*(e_it + e_mit) - 2*(e_it - e_mit) - (e_2k1 - e_m2k1)*(e_2k2 + e_m2k2)

correct_inner_num = (e_2k1 + e_m2k1)*(e_it + e_mit) - 2*(e_it - e_mit) - (e_2k1 - e_m2k1)*(e_2k2 + e_m2k2)

print("User inner numerator:")
print(user_inner_num)
print("\nCorrect inner numerator:")
print(correct_inner_num)

diff = simplify(user_inner_num - correct_inner_num)
print("\nDifference (User - Correct):")
print(diff)

if diff == 0:
    print("\nThe user's expansion is correct.")
else:
    print("\nThe user's expansion is INCORRECT.")
