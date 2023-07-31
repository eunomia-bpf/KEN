from z3 import *


def verify_equation():
    x = Int('x')  # Declare an integer variable 'x'

    # Declare the equation 'x + 2 = 5'
    equation = x + 2 == 5

    # Create a solver and add the equation to it
    solver = Solver()
    solver.add(equation)

    # Check for satisfiability
    if solver.check() == sat:
        # If satisfiable, print the model (i.e., solution for 'x')
        model = solver.model()
        print("Solution for x:", model[x])
    else:
        print("No solution found.")


verify_equation()
