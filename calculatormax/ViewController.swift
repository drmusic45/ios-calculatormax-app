//
//  ViewController.swift
//  calculatormax
//
//  Created by mobilestudio on 3/28/16.
//  Copyright © 2016 mobilestudio. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftVal = ""
    var rightVal = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //setup sound
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
            } catch let err as NSError {
                print(err.debugDescription)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(btn: UIButton!) {
        btnSound.play()
        runningNumber += "\(btn.tag)"
        calcDisplay.text = runningNumber
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                rightVal = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftVal)! * Double(rightVal)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftVal)! / Double(rightVal)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftVal)! - Double(rightVal)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftVal)! + Double(rightVal)!)"
                }
                
                leftVal = result
                calcDisplay.text = result
            }
            
            currentOperation = op
            
        }
        else {
            //This is the first time an operator is pressed
            leftVal = runningNumber
            runningNumber = ""
            currentOperation = op
            
        }
    }
    
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
}

