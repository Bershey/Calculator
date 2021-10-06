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
        numberArray[2].tap()
        dotButton.tap()
        for number in 3...9 {
            numberArray[number].tap()
        }
        XCTAssertEqual(result.label, "1.23456789" )
    }

}
