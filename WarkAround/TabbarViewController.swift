//
//  TabbarViewController.swift
//  WarkAround
//
//  Created by Yohei Fusayasu on 6/6/15.
//  Copyright (c) 2015 Tachikoma. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts
import Fabric
import TwitterKit

class TabbarViewController: UITabBarController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    var mainColor: UIColor = UIColor(red: 0/255, green: 169/255, blue: 191/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Parse Initialize Test
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            println("Object has been saved.")
//        }
        
        UITabBar.appearance().barTintColor = mainColor
        UITabBar.appearance().tintColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //ログアウトしている状態での処理
        if((PFUser.currentUser()) == nil){
            
            //Parse TwitterLogin
            var loginViewController = PFLogInViewController()
            loginViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton |
                PFLogInFields.PasswordForgotten | PFLogInFields.Twitter | PFLogInFields.Facebook
            
            loginViewController.delegate = self
            
            var signUpViewController = PFSignUpViewController()
            signUpViewController.delegate = self
            
            loginViewController.signUpController = signUpViewController
            
            //loginViewControllerのデザイン変更
            loginViewController.logInView?.backgroundColor = mainColor
            // UIImageViewを作成する.
            var myImageView = UIImageView(frame: CGRectMake(0,0,260,90))
            let myImage = UIImage(named: "uselogo.png")
            myImageView.image = myImage
            myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 140.0)
            loginViewController.logInView?.addSubview(myImageView)
            
            self.presentViewController(loginViewController, animated: true, completion: nil)

    }
    }
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        if (!username.isEmpty || !password.isEmpty){
            return true
        }else{
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        if PFTwitterUtils.isLinkedWithUser(user) {
            
            var twitterUsername = PFTwitterUtils.twitter()?.screenName
            PFUser.currentUser()?.username = twitterUsername
            PFUser.currentUser()?.saveEventually(nil)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        println("Failed to login...")
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        if PFTwitterUtils.isLinkedWithUser(user) {
            
            var twitterUsername = PFTwitterUtils.twitter()?.screenName
            PFUser.currentUser()?.username = twitterUsername
            PFUser.currentUser()?.saveEventually(nil)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        println("Failed to signup...")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("user dismissed sign up")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
