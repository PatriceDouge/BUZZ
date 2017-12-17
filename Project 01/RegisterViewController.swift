//
//  RegisterViewController.swift
//  Project 01
//
//  Created by Patrice Douge on 11/8/17.
//  Copyright © 2017 Mobile App Development. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var reEnterPassTF: UITextField!
    @IBOutlet weak var userPassTF: UITextField!
    @IBOutlet weak var userEmailTF: UITextField!
    
    @IBOutlet var register: UIButton!
    @IBOutlet var alreadyHaveAcc: UIButton!
    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var reEnterPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEmailTF.placeholder = "username"
        userPassTF.placeholder = "password"
        reEnterPassTF.placeholder = "re-enter password"
        
        register.setTitle("Register", for: .normal)
        alreadyHaveAcc.setTitle("Already have an account? Click here", for: .normal)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func alreadyHaveActBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtnTapped(_ sender: Any) {
        
        //getting texfield values
        let userEmail = userEmailTF.text;
        let userPassword = userPassTF.text;
        let reEnterPassword = reEnterPassTF.text;
        
        //checking for empty textfields
        if(userEmail!.isEmpty || userPassword!.isEmpty || reEnterPassword!.isEmpty) {
            
            displayAlertMessage(userMessage: "All fields are required");
            return;
        }
        
        //check is password and second password is same
        if(userPassword != reEnterPassword) {
            
            displayAlertMessage(userMessage: "Passwords do not match");
            return;
        }
        
        //Storing user data
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        
        UserDefaults.standard.synchronize()
        
        //Displaying message
        var myAlert = UIAlertController(title: "Alert", message: "You are now registerd!", preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default) {
            action in
            self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    func displayAlertMessage(userMessage: String) {
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil)
    }

    
}

