//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by minmin on 2021/10/04.
//

import Foundation

struct CalculatorLogic {
    // MARK: -Properties
    private  var number: Double?
    var intermediateCalculation: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }


    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }

    func performTwoNumCalculation(n2: Double) -> Double? {

        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
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

    func checkdContainDotNumber(number: String, displayText: String) -> String?  {
        if number == "." && displayText.contains(".") {
            return nil
        }
        return number
    }

}
