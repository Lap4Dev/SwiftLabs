import Foundation

enum DivisionError: Error {
    case divisionByZero
}

func addOperands(firstOperand: Float?, secondOperand: Float?) -> Float? {
  guard let firstNumber = firstOperand else {
    return nil
  } 
  guard let secondNumber = secondOperand else {
    return nil
  }
  return firstNumber + secondNumber
}

func subtractOperands(firstOperand: Float?, secondOperand: Float?) -> Float? {
  guard let firstNumber = firstOperand else {
    return nil
  } 
  guard let secondNumber = secondOperand else {
    return nil
  }
  return firstNumber - secondNumber
}

func divideOperands(firstOperand: Float?, secondOperand: Float?) throws -> Float? {
  guard let firstNumber = firstOperand else {
    return nil
  } 
  guard let secondNumber = secondOperand else {
    return nil
  }
  if secondOperand == 0 {
    throw DivisionError.divisionByZero
  }
  return firstNumber / secondNumber
}

func multiplyOperands(firstOperand: Float?, secondOperand: Float?) -> Float? {
  guard let firstNumber = firstOperand else {
    return nil
  } 
  guard let secondNumber = secondOperand else {
    return nil
  }
  return firstNumber * secondNumber
}

func calculateOperands(operation: String?, firstOperand: Float?, secondOperand: Float?) throws -> Float? {
  guard let firstNumber = firstOperand else {
    return nil
    } 
    guard let secondNumber = secondOperand else {
      return nil
    }
    guard let operation = operation else {
      return nil
    }
    switch operation {
          case "+":
            return addOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          case "-":
            return subtractOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          case "/":
            return try divideOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          case "*":
            return multiplyOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          default:
            return nil
        }
}
func testTask() {
  do {
    let firstNumber: Float? = 10
    let secondNumber: Float? = 5
    let operation: String? = "/"
    let result: Float? = try calculateOperands(operation:operation, firstOperand:firstNumber, secondOperand:secondNumber)

    if let result = result {
      print(result)
    } else {
      print("Вам потрібно ввести коректні дані!")
    }
  } catch DivisionError.divisionByZero {
    print("DivisionByZero Error")
  }
  catch {}
}

// ---- Test
testTask()


