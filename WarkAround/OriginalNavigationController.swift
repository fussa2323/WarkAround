//
//  OriginalNavigationController.swift
//  WarkAround
//
//  Created by Yohei Fusayasu on 6/6/15.
//  Copyright (c) 2015 Tachikoma. All rights reserved.
//

import UIKit

class OriginalNavigationController: UINavigationController {

    override func viewDidLoad() {
            super.viewDidLoad()
            //Coloers
            var mainColor: UIColor = UIColor(red: 0/255, green: 169/255, blue: 191/255, alpha: 1.0)
            //Navavr Custom
            self.navigationBar.tintColor = UIColor.whiteColor()// バーアイテムカラー
            self.navigationBar.barTintColor = mainColor  // バー背景色
            self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        


}
