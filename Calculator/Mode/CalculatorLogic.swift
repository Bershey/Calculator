//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by minmin on 2021/10/04.
//

import Foundation

struct CalculatorLogic {
    private  var number: Double?
    var intermediateCalculation: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    mutating func calculate(symbol: String) -> Double? {
        if let selectedNumber = number {
            switch symbol {
            case "+/-":
                return selectedNumber * -1
            case "AC":
                intermediateCalculation?.n1 = 0
                return 0
            case "%":
                return selectedNumber * 0.01
            case "=":
                return performTwoNumCalculation(secondNumber: selectedNumber)
            case "√":
                return sqrt(selectedNumber)
            default:
                intermediateCalculation = (n1: selectedNumber, calcMethod: symbol)
            }
        }
        return nil
    }

    func performTwoNumCalculation(secondNumber: Double) -> Double? {
        if let firstNumber = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return firstNumber - secondNumber
            case "×":
                return firstNumber * secondNumber
            case "÷":
                return firstNumber / secondNumber
            default:
                break
            }
        }
        return nil
    }

    func checkedNumber(number: String) -> String {
        if number == "." {
            return "0."
        } else {
            return number
        }
    }

    func checkdContainDotNumber (number: String, displayText: String) -> String? {
        if number == "." && displayText.contains(".") {
            return nil
        }
        return number
    }
}
