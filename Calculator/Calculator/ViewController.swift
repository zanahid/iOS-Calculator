//
//  ViewController.swift
//  Calculator
//
//  Created by Nahid Hasan on 27/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CalculatorWorkings: UILabel!
    @IBOutlet weak var CalculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }

   func clearAll()
   {
    workings = ""
    CalculatorWorkings.text = ""
    CalculatorResults.text = ""
    
    
   }
    
    @IBAction func ClearAllTap(_ sender: Any) {
        
        clearAll()
    }
   
    @IBAction func BackTap(_ sender: Any) {
        
        if (!workings .isEmpty)
        {
            workings.removeLast()
            CalculatorWorkings.text = workings
        }
        
    }
    
    
    func addToWorkings (value: String)
    {
        workings = workings + value
        CalculatorWorkings.text = workings
        
    }
    
    
 
    @IBAction func PercentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func DivTap(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func MultiplyTap(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func SubtractTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    
    @IBAction func AddTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func ResultTap(_ sender: Any) {
        
        if (validInput())
        {
        let checkWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
        
        let expression = NSExpression (format: checkWorkingsForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        CalculatorResults.text = resultString
        }
        
        else
        {
            let alert = UIAlertController(
                title: "Invalid Inlpur bro",
                message: "Calculator unable do math baka",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool
    {
        
        var count = 0
        var funcCharIndexes = [Int]()
        for char in workings
        {
         
            if (specialCharacters(char: char))
         {
                funcCharIndexes.append(count)
         }
            count += 1
            
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if (index == 0)
            {
                return false
            }
            
            if (index == workings.count-1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if ( index - previous == 1)
                {
                    return false
                    
                }
            }
            previous = index
        }
        
        
        
        return true
    }
    
    func specialCharacters(char: Character) -> Bool
    {
        if (char == "*")
        {
            return true
        }
        
        if (char == "/")
        {
            return true
        }
        
        if (char == "+")
        {
            return true
        }
        
       return false
        
        
    }
    
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1)==0)
        {
            return String(format: "%.0f" , result)
        }
        else
        {
            return String(format: "%.2f" , result)
        }
        
        
    }
    
    
    @IBAction func ZeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func OneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func TwoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }

    @IBAction func ThreeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func FourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func FiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func SixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func SevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func EightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func NineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
    


    @IBAction func DotTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    









}

