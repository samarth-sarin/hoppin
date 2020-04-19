//
//  ViewController.swift
//  hoppin2 test
//
//  Created by Samarth Sarin on 3/10/20.
//  Copyright © 2020 Samarth Sarin. All rights reserved.
//

import UIKit
import MessageUI

class HomeViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    

    
    @IBOutlet weak var restaurantTextField: UITextField!
    var selectedRestaurant: String?
    var listOfRestaurant = ["Zingermans", "Frita Batidos", "Slurping Turtle", "Snap Pizza", "Tomokun", "Isalita", "Sava's", "Buffalo Wild Wings", "TK Wu", "Sadako", "Pizza House", "Charley's", "Brown Jug", "Taco Bell", "McDonalds", "Wendy's", "Subway", "Kangs", "Rich JC", "Belly Deli", "Tropical Smoothie", "Cold Stone"]
    
    
    var num = "000000000";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createAndSetupPickerView()
        self.dismissAndClosePickerView()
    }
    
    func createAndSetupPickerView() {
        let pickerview = UIPickerView()
        pickerview.delegate = self
        pickerview.dataSource = self
        self.restaurantTextField.inputView = pickerview
    }
    
    func dismissAndClosePickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissAction))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        self.restaurantTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissAction() {
        self.view.endEditing(true)
    }
    
    
    @IBAction func sendText(_ sender: UIButton) {
        
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "My name is Samarth and I am ordering from Taco Bell"
            controller.recipients = [num]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
        else {
            print("SMS services are not available")
        }
        
        //move to next view?
        self.performSegue(withIdentifier:"SecondViewSegue", sender: self);
        
        
    }
    

    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.listOfRestaurant.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.listOfRestaurant[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedRestaurant = self.listOfRestaurant[row]
        self.restaurantTextField.text = self.selectedRestaurant
    }
    
}

