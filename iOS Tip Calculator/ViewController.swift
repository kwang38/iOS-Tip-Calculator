//
//  ViewController.swift
//  iOS Tip Calculator
//
//  Created by Kan Wang on 1/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    
    @IBOutlet weak var partyControl: UIStepper!
    @IBOutlet weak var partyCountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var individualBillTotalLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        partyControl.minimumValue = 1
        tipSlider.value = 0.15
    }
    
    


    @IBAction func billAmountChanged(_ sender: UITextField) {
        updateBill()
    }
    
    @IBAction func tipPercentageChanged(_ sender: UISlider) {
        let percentTip = sender.value * 100
        tipPercentLabel.text = String(format: "%.0f%%", percentTip)
        updateBill()
    }
    
    
    @IBAction func partyCountChanged(_ sender: UIStepper) {
        partyCountLabel.text = String(format: "%.0f", sender.value)
        updateBill()
    }
    
    
    
    
    func updateBill() {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentage = Int(tipPercentLabel.text!.dropLast()) ?? 15
        let partySize = Int(partyCountLabel.text!) ?? 1
        let tip = bill * (Double(tipPercentage) / 100)
        let total = bill + tip
        let individualCost = total / Double(partySize)
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        individualBillTotalLabel.text = String(format: "$%.2f each", individualCost)
    }
    
}

