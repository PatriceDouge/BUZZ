//
//  ComposeViewController.swift
//  Project 01
//
//  Created by Patrice Douge on 12/13/17.
//  Copyright © 2017 Mobile App Development. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var composeTextView: UITextView!
    
    @IBAction func postBtnTapped(_ sender: Any) {
        
        if(composeTextView.text != "") {
            
            let newPost = Feed(text: composeTextView.text)
            newPost.save()
            
            self.navigationController!.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
