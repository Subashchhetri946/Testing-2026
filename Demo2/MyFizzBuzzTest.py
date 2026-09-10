import unittest
import FizzBuzzEngine

class MyFizzBuzzTest(unittest):
    def test_Send_2_to_FizzBuzzEngine_Result_2(self):
        #Arrange
        value = int(2)
        exceptedResult = int(2)

        #Act
        result = FizzBuzzEngine.outputResult(value)

        #Assert
        self.assertEqual(result, exceptedResult)

    def test_Send_3_to_FizzBuzzEngine_Result_(self):
         #Arrange
         value = int(3)
         exceptedResult = "Fizz"
    
         #Act
         result = FizzBuzzEngine.outputResult(value)
    
         #Assert
         self.assertEqual(result, exceptedResult)


if (__name__ == "__main__"):
    unittest.main()