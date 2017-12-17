//
//  FeedTableViewCell.swift
//  Project 01
//
//  Created by Patrice Douge on 12/13/17.
//  Copyright © 2017 Mobile App Development. All rights reserved.
//

import UIKit
import Firebase

class FeedTableViewCell: UITableViewCell
{
    fileprivate let likeColor = UIColor(red: 243.0/255.0, green: 62.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    fileprivate let dislikeColor = UIColor(red: 155/255.0, green: 53/255.0, blue: 181/255.0, alpha: 1.0)
    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var feedLabel: UILabel!
    @IBOutlet weak var dislikeButton: UIButton!
    
    var feed: Feed! {
        didSet {
            feedLabel.text = feed.text
            likeButton.setTitle("👍🏽 \(feed.numOfLikes)", for: [])
            dislikeButton.setTitle("👎🏽 \(feed.numOfDislikes)", for: [])
        }
    }
    
    @IBAction func dislikeDidTouch(_ sender: AnyObject) {
        feed.dislike()
        dislikeButton.setTitle("👎🏽 \(feed.numOfDislikes)", for: [])
        dislikeButton.setTitleColor(dislikeColor, for: [])
    }
    
    @IBAction func likeDidTouch(_ sender: AnyObject)
    {
        feed.like()
        likeButton.setTitle("👍🏽 \(feed.numOfLikes)", for: [])
        likeButton.setTitleColor(likeColor, for: [])
    }
}
