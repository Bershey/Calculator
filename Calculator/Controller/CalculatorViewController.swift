//
//  ViewController.swift
//  Calculator
//
//  Created by minmin on 2021/10/04.
//

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet weak var displayLabel: UILabel!

    // MARK: - Properties

    private var isFinishedTypingNumber: Bool = true
    private var calculator = CalculatorLogic()

    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                return 0
            }
            return number
        }
        set {
            if String(newValue).hasSuffix(".0") {
                displayLabel.text = String(newValue.description.replacingOccurrences(of: ".0", with: ""))
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text =   calculator.checkedNumber(number: numValue)
                isFinishedTypingNumber = false
            } else {
                displayLabel.text! += calculator.checkdContainDotNumber(number: numValue,
                                                                        displayText: displayLabel.text!) ?? ""
            }
        }
    }

    @IBAction func calculatorButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
}
