//
//  CouponViewController.swift
//  WarkAround
//
//  Created by Yohei Fusayasu on 6/6/15.
//  Copyright (c) 2015 Tachikoma. All rights reserved.
//

import UIKit

class CouponViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "Coupon"
        let image = UIImage(named: "cou_360.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 180, 20)
        imageView.sizeThatFits(CGSize(width: 180, height: 20))
        self.navigationItem.titleView = imageView
        // Do any additional setup after loading the view.
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
