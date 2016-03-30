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
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftVal = ""
    var rightVal = ""
    var currentOperation: Operation = Operation.Empty
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        
    }
    
    func processOperation(op: Operation) {
        
    }
}

