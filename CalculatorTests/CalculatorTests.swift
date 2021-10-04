//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by minmin on 2021/10/04.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var calc = CalculatorLogic()

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

}
