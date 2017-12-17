//
//  ViewController.swift
//  Project 01
//
//  Created by Patrice Douge on 11/7/17.
//  Copyright © 2017 Mobile App Development. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        let userEmail = emailTF.text
        let userPassword = passwordTF.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if(userEmailStored == userEmail && userPasswordStored == userPassword) {
            
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
            
            var myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar")
                as! UITabBarController
            
            var appDelegate = UIApplication.shared.delegate as! AppDelegate;
            
            appDelegate.window?.rootViewController = myTabBar
            
            (sender as! UIButton).alpha = 1.0
            
            Auth.auth().signInAnonymously { (firUser, error) in
                if (error == nil) {
                    //login
                }
                else {
                    //error
                }
            }
    
        }
        else {
            
            var myAlert = UIAlertController(title: "Alert", message: "Please enter a valid username or password", preferredStyle: UIAlertControllerStyle.alert);
            
            let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default) {
                action in
                self.dismiss(animated: true, completion: nil)
                
            }
            
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerBtn.setTitle("New here? Click here to Register", for: .normal)
        loginBtn.setTitle("Login", for: .normal)
        
        emailTF.placeholder = NSLocalizedString("username", comment: "This is for the username textfield")
        passwordTF.placeholder = NSLocalizedString("password", comment: "This is for the passoword textfield")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

