//
//  Feed.swift
//  Project 01
//
//  Created by Patrice Douge on 12/13/17.
//  Copyright © 2017 Mobile App Development. All rights reserved.
//

import Foundation
import Firebase

class Feed {
    
    var text: String = ""
    var numOfLikes = 0
    var numOfDislikes = 0
    let ref: DatabaseReference!
    
    init(text: String) {
        self.text = text
        //Create reference to database
        ref = Database.database().reference().child("posts").childByAutoId()
    }
    
    init(snapchot: DataSnapshot) {
        
        ref = snapchot.ref
        if let value = snapchot.value as? [String : Any] {
            text = value["text"] as! String
            numOfLikes = value["numOfLikes"] as! Int
            numOfDislikes = value["numOfDislikes"] as! Int
        }
    }
    
    func save() {
        ref.setValue(toDictionary())
    }
    
    func toDictionary() -> [String : Any] {
        
        return [
            "text" : text,
            "numOfLikes" : numOfLikes,
            "numOfDislikes" : numOfDislikes
        ]
    }
    
    func like() {
        numOfLikes += 1
        ref.child("numOfLikes").setValue(numOfLikes)
        }
    
    func dislike() {
        numOfDislikes += 1
        ref.child("numOfDislikes").setValue(numOfDislikes)
    }
}
