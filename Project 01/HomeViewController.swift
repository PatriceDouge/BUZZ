//
//  HomeViewController.swift
//  Project 01
//
//  Created by Patrice Douge on 11/8/17.
//  Copyright © 2017 Mobile App Development. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UITableViewController {
    
        
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var homeNavBar: UINavigationItem!
    
    let postsRef = Database.database().reference().child("posts")
    var posts = [Feed]()
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        
        postsRef.observe(.value, with: {(snapchot) in
            self.posts.removeAll()
            
            for child in snapchot.children {
                let childSnapchot = (child as! DataSnapshot)
                let feed = Feed(snapchot: childSnapchot)
                self.posts.insert(feed, at: 0)
            }
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 92.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func logoutBtnTapped(_ sender: Any) {
        
        var signInView = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! ViewController
        
        var appDelegate = UIApplication.shared.delegate as! AppDelegate;
        
        appDelegate.window?.rootViewController = signInView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Feed Cell", for: indexPath) as! FeedTableViewCell
        let feed = posts[indexPath.row]
        
        cell.feed = feed
        
        return cell
    }
}


