//
//  FirstViewController.swift
//  calculator app
//
//  Created by Student03 on 2019-04-24.
//  Copyright © 2019 Student03. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController: UIViewController {
    
    var numOnScreen:Double = 0;
    var privateNumDisplay = "";
    
    @IBOutlet weak var numDisplay: UILabel!
    
    @IBOutlet weak var ansDisplay: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        numDisplay.text = String(numDisplay.text ?? "0") + String(sender.tag-1)
        privateNumDisplay = privateNumDisplay + String(Double(sender.tag)-1.0)
        
    }
    
    @IBAction func calcButtons(_ sender: UIButton) {
        
        if numDisplay.text != "" {
            if sender.tag == 15 {
                numDisplay.text = numDisplay.text! + "/"
                privateNumDisplay = privateNumDisplay + "/"
            }
            else if sender.tag == 16 {
                numDisplay.text = numDisplay.text! + "*"
                privateNumDisplay = privateNumDisplay + "*"
            }
            else if sender.tag == 17 {
                numDisplay.text = numDisplay.text! + "-"
                privateNumDisplay = privateNumDisplay + "-"
            }
            else if sender.tag == 18 {
                numDisplay.text = numDisplay.text! + "+"
                privateNumDisplay = privateNumDisplay + "+"
            }
            else if sender.tag == 14 {
                numDisplay.text = String(numDisplay.text!.dropLast())
                privateNumDisplay = String(privateNumDisplay.dropLast())
            }
            else if sender.tag == 11 {
                numDisplay.text = ""
                ansDisplay.text = ""
                privateNumDisplay = ""
            }
        }
        
        if sender.tag == 12 {
            numDisplay.text = numDisplay.text! + "("
            privateNumDisplay = privateNumDisplay + "("
        }
        
        if sender.tag == 13 {
            numDisplay.text = numDisplay.text! + ")"
            privateNumDisplay = privateNumDisplay + ")"
        }
        
        if sender.tag == 19 {
            numDisplay.text = numDisplay.text! + "."
            privateNumDisplay = privateNumDisplay + "."
        }
        
        if sender.tag == 20 {
            let calculate = NSExpression(format: String(privateNumDisplay))
            let value: Int = 0
            
            do {
                let answer = try calculate.expressionValue(with: nil, context: nil) as? Double ?? 0
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                var value = try formatter.string(from: NSNumber(value: answer))
            } catch {
                var value = "Error"
            }
        
            ansDisplay.text = String(value)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
