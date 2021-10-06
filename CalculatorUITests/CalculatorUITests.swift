//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by minmin on 2021/10/04.
//

import XCTest

class CalculatorUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testNumberButtonPressed() {
        let app = XCUIApplication()
        app.launch()
        let result = app.staticTexts["result"]
        var numberArray: [XCUIElement] = []
        for number in 0...9 {
            let numberButton = app.buttons["\(number)"]
            numberArray.append(numberButton)
        }
        let dotButton = app.buttons["dot"]
        numberArray[0].tap()
        numberArray[1].tap()
        dotButton.tap()
        dotButton.tap()
        dotButton.tap()
        numberArray[2].tap()
        dotButton.tap()
        for number in 3...9 {
            numberArray[number].tap()
        }
        XCTAssertEqual(result.label, "1.23456789" )
    }

    func testFirstZero() {
        let app = XCUIApplication()
        app.launch()
        let zero = app.buttons["0"]
        let one = app.buttons["1"]
        let dot = app.buttons["dot"]
        let result = app.staticTexts["result"]

        zero.tap()
        zero.tap()
        zero.tap()
        dot.tap()
        one.tap()
        XCTAssertEqual(result.label, "0.1" )
    }

    func testFirstConsecutiveDot() {
        let app = XCUIApplication()
        app.launch()
        let dot = app.buttons["dot"]
        let result = app.staticTexts["result"]

        dot.tap()
        dot.tap()
        dot.tap()
        XCTAssertEqual(result.label, "0." )
    }

}
