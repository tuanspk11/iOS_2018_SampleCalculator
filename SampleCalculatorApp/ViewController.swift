//
//  ViewController.swift
//  SampleCalculatorApp
//
//  Created by Tuan SPK on 4/20/18.
//  Copyright © 2018 Tuan SPK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var isFirstNumber = true
    var operation = ""
    var soThu1:Double = 0
    
    var is1 = true
    
    var displayValue:Double {
        get {
            return NumberFormatter().number(from: label.text!)!.doubleValue
        } set {
            label.text = String(newValue)
            operation = ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chuSo(_ sender: Any) {
        if is1 {
            isFirstNumber = true
        }
        if isFirstNumber {
            label.text = (sender as AnyObject).currentTitle!
        } else {
            label.text! += (sender as AnyObject).currentTitle!!
        }
        isFirstNumber = false
        is1 = false
    }
    
    @IBAction func cancel(_ sender: Any) {
        displayValue = 0
        label.text = String("")
    }
    
    @IBAction func calculator(_ sender: Any) {
        is1 = true
        switch operation {
        case "+":
            displayValue += soThu1
            break
        case "-":
            displayValue = soThu1 - displayValue
            break
        case "*":
            displayValue *= soThu1
            break
        case "/":
            displayValue = soThu1 / displayValue
            break
        default: break
        }
    }
    
    @IBAction func toanTu(_ sender: Any) {
        operation = (sender as AnyObject).currentTitle!!
        soThu1 = displayValue
        isFirstNumber = true
    }
}

