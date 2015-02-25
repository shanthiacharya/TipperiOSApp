//
//  ViewController.swift
//  Tipster
//
//  Created by Acharya, Shanthi (GE Global Research) on 2/20/15.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstView: UIView!
    
    @IBOutlet var tipLabel: UILabel!
    
    @IBOutlet var billText: UITextField!
    
    @IBOutlet var totalLabel: UILabel!
    
    
    @IBOutlet var totalLabeltwo: UILabel!
    
    
    @IBOutlet var totalLabelthree: UILabel!
    
    
    @IBOutlet var totalLabelfour: UILabel!
    
    @IBOutlet var tipControl: UISegmentedControl!
    
    @IBOutlet var dollarsign: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipControl.layer.cornerRadius = 5
        tipControl.clipsToBounds = true
        
       
        
        tipLabel.text = "$0.00"
       
        tipControl.alpha = 0
        tipLabel.alpha = 0
        firstView.alpha = 0
        totalLabel.text = "$0.00"
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       billText.becomeFirstResponder()
        tipControl.layer.cornerRadius = 5
        tipControl.clipsToBounds = true

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
  
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.10, 0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string:billText.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var totalfor2 = total / Double(2)
        var totalfor3 =  round (total / Double(3))
        var totalfor4 = total / Double(4)
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        totalLabeltwo.text = String(format: "%.2f", totalfor2)
        totalLabelthree.text = String(format: "%.1f", totalfor3)
        totalLabelfour.text = String(format: "%.2f", totalfor4)

        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        totalLabeltwo.text = "$\(totalfor2)"
        totalLabelthree.text = "$\(totalfor3)"
        totalLabelfour.text = "$\(totalfor4)"
        
        
        
        println(  tipLabel.text)
        
        
        if (billText.text == ""){
            
            // Animate down
            
            UIView.animateWithDuration(0.5, animations: {
                // This causes first view to fade in and second view to fade out
                self.billText.frame = CGRectMake(209, 183, 150, 80)
                
                self.dollarsign.frame = CGRectMake(168, 183, 39, 82)
                
                self.firstView.frame = CGRectMake(0, 569, 480, 568)
                
                self.firstView.alpha = 0.0
                self.tipControl.alpha = 0.0
                self.tipLabel.alpha = 0.0
                
            })
            
        }
        else
        {
            //Animate up
            
            
            UIView.animateWithDuration(0.5, animations: {
                // This causes first view to fade in and second view to fade out
                
                // self.firstView.frame = CGRectOffset(self.firstView.frame, 0,  0.7)
                
                self.billText.frame = CGRectMake(209, 153, 150, 80)
                
                self.dollarsign.frame = CGRectMake(168, 153, 39, 82)
                
                
                self.firstView.frame = CGRectMake(0, 323, 480, 568)
                
                self.firstView.alpha = 1.0
                self.tipControl.alpha = 1.0
                self.tipLabel.alpha = 1.0
                
            })
            
        }

       
        
        
    }
    
    
    
    @IBAction func onEditingEnd(sender: AnyObject) {
        
        
        if (billText.text == "")
        {
           
            println(" No text")
            
        }
        
        
        
        
    }
    
    @IBAction func onEditingBegin(sender: AnyObject) {
       
        
        
    }
    
    
    
    @IBAction func onSegmentControlChange(sender: AnyObject) {
    
    view.endEditing(true)
    
    }
    
    
    
    
   
    
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        var movementDuration:NSTimeInterval = 0.3
        var movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.firstView.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
}

