# Subash Chhetri
import unittest
from triangle import check_triangle

class TestTriangle(unittest.TestCase):

    def test_equilateral(self):

        # Arrange
        a = 5
        b = 5
        c = 5

        # Act
        result = check_triangle(a, b, c)

        # Assert
        self.assertEqual(result, "Isosceles triangle")

    def test_isosceles(self):
        # Arrange
        a = 5
        b = 5
        c = 3
        
        # Act
        result = check_triangle(a, b, c)
        
        # Assert
        self.assertEqual(result, "Isosceles triangle")


    def test_irregular(self):
        # Arrange
        a = 3
        b = 4
        c = 5
        
        # Act
        result = check_triangle(a, b, c)
        
        # Assert
        self.assertEqual(result, "Irregular triangle")