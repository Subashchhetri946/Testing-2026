def check_triangle(a, b, c):

    if a == b and b == c:
        return "Equilateral triangle"

    elif a == b or a == c or b == c:
        return "Isosceles triangle"

    else:
        return "Irregular triangle"

if __name__ == "__main__":
    a = int(input("Enter the first side of the triangle:"))
    b = int(input("Enter the second side of the triangle:"))
    c = int(input("Enter the third side of the triangle:"))

    print(check_triangle(a, b, c))