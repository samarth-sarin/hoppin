//
//  ViewController.swift
//  hoppin2 test
//
//  Created by Samarth Sarin on 3/10/20.
//  Copyright © 2020 Samarth Sarin. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {

    
  
    @IBOutlet weak var minTextField: UILabel!
    
    @IBOutlet weak var secTextField: UILabel!
    
    
    @IBOutlet weak var timerTextField: UILabel!
    
    override func viewDidLoad() {
        print("Second View loaded");

        self.timerTextField.text = "Timer"

        var timeLeft = 900
        
        var min = timeLeft/60
        
        var sec = timeLeft % 60
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            timer in
            print("timer fired!")
            
            timeLeft -= 1
            
            min = timeLeft/60
            
            sec = timeLeft % 60
            
            if (sec == 9) {
                
            }
            
            var min_string = String(min)
            var sec_string = String(sec)
            
            if (sec_string == "9") {
                sec_string = "09"
            }
            if (sec_string == "8") {
                sec_string = "08"
            }
            
            if (sec_string == "7") {
                sec_string = "07"
            }
            
            if (sec_string == "6") {
                sec_string = "06"
            }
            
            if (sec_string == "5") {
                sec_string = "05"
            }
            
            if (sec_string == "4") {
                sec_string = "04"
            }
            if (sec_string == "3") {
                sec_string = "03"
            }
            if (sec_string == "2") {
                sec_string = "02"
            }
            if (sec_string == "1") {
                sec_string = "01"
            }
            if (sec_string == "0") {
                sec_string = "00"
            }
            
            self.minTextField.text = min_string
            self.secTextField.text = sec_string
            
            //self.timerTextField.text = String(timeLeft)
            print(timeLeft)
            
            if(timeLeft==0){
                timer.invalidate()
            }
        }
        
        
        
        
    }
    
    
    
}

