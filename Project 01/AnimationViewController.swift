//
//  AnimationViewController.swift
//  Project 01
//
//  Created by Patrice Douge on 11/10/17.
//  Copyright © 2017 Mobile App Development. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            print("camera selected")
        }
        else {
            picker.sourceType = .photoLibrary
            print("photo library selected")
        }
        
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = photo
        
        dismiss(animated: true, completion: nil)
    }
    
}
