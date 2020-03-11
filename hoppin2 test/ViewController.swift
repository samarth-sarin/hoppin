//
//  ViewController.swift
//  hoppin2 test
//
//  Created by Samarth Sarin on 3/10/20.
//  Copyright © 2020 Samarth Sarin. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    
    var num = "8108134200";
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendText(_ sender: UIButton) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "This is our message"
            controller.recipients = [num]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
        else {
            print("SMS services are not available")
        }
    }
    

    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

