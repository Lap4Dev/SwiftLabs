import Foundation

extension String {
  static let minus = "-"
  static var add: Self {
    return "+"
  }
  static let multiply = "*"
  static let divide = "/"
}

enum DivisionError: Error {
    case genericMathError(firstOperand: Float, secondOperand: Float, message: String)
}

func addOperands(firstOperand: Float?, secondOperand: Float?) -> Float? {
  guard let firstNumber = firstOperand, 
        let secondNumber = secondOperand else {
    return nil
  }
  return firstNumber + secondNumber
}

func subtractOperands(firstOperand: Float?, secondOperand: Float?) -> Float? {
  guard let firstNumber = firstOperand, 
        let secondNumber = secondOperand else {
    return nil
  } 
  return firstNumber - secondNumber
}

func divideOperands(firstOperand: Float?, secondOperand: Float?) throws -> Float? {
  guard let firstNumber = firstOperand,
        let secondNumber = secondOperand else {
    return nil
  } 
  if secondOperand == .zero {
    throw DivisionError.genericMathError(firstOperand: firstNumber, secondOperand: secondNumber, message: "Division by zero")
  }
  return firstNumber / secondNumber
}

func multiplyOperands(firstOperand: Float?, secondOperand: Float?) -> Float? {
  guard let firstNumber = firstOperand,
        let secondNumber = secondOperand else {
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
          case .add:
            return addOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          case .minus:
            return subtractOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          case .divide:
            return try divideOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          case .multiply:
            return multiplyOperands(firstOperand: firstNumber, secondOperand: secondNumber)
          default:
            return nil
        }
}
func testTask() {
  do {
    let firstNumber: Float? = 10
    let secondNumber: Float? = 4
    let operation: String? = .minus
    let result: Float? = try calculateOperands(operation:operation, firstOperand:firstNumber, secondOperand:secondNumber)

    if let result = result {
      print(result)
    } else {
      print("You must enter valid data!")
    }
  } catch DivisionError.genericMathError(let a, let b, let m)  {
    print(
      "Division by zero error: \n" +
      "First operand: " + String(a) + "\n" + 
      "Second operand: " + String(b) + "\n" +
      "Message: " + m
      )
  }
  catch {}
}

// ---- Test
testTask()


