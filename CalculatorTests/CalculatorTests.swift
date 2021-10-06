//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by minmin on 2021/10/04.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    // MARK: - Properties

    var calc = CalculatorLogic()

    // MARK: - testOperation

    func testAdd() {
        calc.intermediateCalculation = (n1: 3, calcMethod: "+")
        let newValue = calc.performTwoNumCalculation(secondNumber: 4)
        XCTAssertEqual(newValue, 7)
    }

    func testSubtract() {
        calc.intermediateCalculation = (n1: 3, calcMethod: "-")
        let newValue = calc.performTwoNumCalculation(secondNumber: 4)
        XCTAssertEqual(newValue, -1)
    }

    func testMultiply() {
        calc.intermediateCalculation = (n1: 3, calcMethod: "×")
        let newValue = calc.performTwoNumCalculation(secondNumber: 4)
        XCTAssertEqual(newValue, 12)
    }

    func testDeivide() {
        calc.intermediateCalculation = (n1: 12, calcMethod: "÷")
        let newValue = calc.performTwoNumCalculation(secondNumber: 4)
        XCTAssertEqual(newValue, 3)
    }

    // MARK: - testSpecialOperation

    func testChengeSign() {
        calc.setNumber(2)
        let newValue = calc.calculate(symbol: "+/-")
        XCTAssertEqual(newValue, -2)
    }

    func testPercent() {
        calc.setNumber(3)
        let newValue = calc.calculate(symbol: "%")
        XCTAssertEqual(newValue, 0.03)
    }

    func testAllClear() {
        calc.setNumber(4)
        let newValue = calc.calculate(symbol: "AC")
        XCTAssertEqual(newValue, 0)
    }

    func testEqual () {
        calc.setNumber(3)
        calc.intermediateCalculation = (n1: 12, calcMethod: "+")
        let newValue = calc.calculate(symbol: "=")
        XCTAssertEqual(newValue, 15)
    }

    func testSquareRoot () {
        calc.setNumber(9)
        let newValue = calc.calculate(symbol: "√")
        XCTAssertEqual(newValue, 3)
    }

    // MARK: - testDecimalPoint

    func testCheckContainDot() {
        let newValue = calc.checkdContainDotNumber(number: ".", displayText: "3.14")
        XCTAssertEqual(newValue, "")

    }

    func testCheckReturnNumber() {
        let newValue = calc.checkdContainDotNumber(number: "3", displayText: "3.14")
        XCTAssertEqual(newValue, "3")
    }

}
