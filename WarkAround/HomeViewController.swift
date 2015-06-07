//
//  HomeViewController.swift
//  WarkAround
//
//  Created by Yohei Fusayasu on 6/6/15.
//  Copyright (c) 2015 Tachikoma. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    private let myItems: NSArray = ["2015/06/05           12,390 Steps         >", "2015/06/04             9,390 Steps         >", "2015/06/03           11,220 Steps         >", "2015/06/02             6,390 Steps         >", "2015/06/01           32,390 Steps         >"]
    var mainColor: UIColor = UIColor(red: 0/255, green: 169/255, blue: 191/255, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        //Title画像
        let image = UIImage(named: "home_360.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 180, 20)
        imageView.sizeThatFits(CGSize(width: 180, height: 20))
        self.navigationItem.titleView = imageView
//        self.title = "Home"
        
        self.nameLabel.text = PFUser.currentUser()?.username
        
//        profileImageView.layer.cornerRadius = CGRectGetHeight(profileImageView.frame) / 2.0
//        profileImageView.layer.masksToBounds = true;
        self.myTableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        
        return cell
    }
    
    //logoutButton
    @IBAction func logOutButtonAction(sender: AnyObject) {
        PFUser.logOutInBackground()
        
//            //Parse TwitterLogin
//            var loginViewController = PFLogInViewController()
//            loginViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton |
//                PFLogInFields.PasswordForgotten | PFLogInFields.Twitter | PFLogInFields.Facebook
//            
//            loginViewController.delegate = self
//            
//            var signUpViewController = PFSignUpViewController()
//            signUpViewController.delegate = self
//            
//            loginViewController.signUpController = signUpViewController
//            
//            //loginViewControllerのデザイン変更
//            loginViewController.logInView?
//        .backgroundColor = mainColor
//            // UIImageViewを作成する.
//            var myImageView = UIImageView(frame: CGRectMake(0,0,260,90))
//            let myImage = UIImage(named: "uselogo.png")
//            myImageView.image = myImage
//            myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 140.0)
//            loginViewController.logInView?.addSubview(myImageView)
//            
//            self.presentViewController(loginViewController, animated: true, completion: nil)
        
        

    }
    

}
