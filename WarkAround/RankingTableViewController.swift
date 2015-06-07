//
//  RankingTableViewController.swift
//  WarkAround
//
//  Created by Yohei Fusayasu on 6/6/15.
//  Copyright (c) 2015 Tachikoma. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class RankingTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    //ランキング用のデータ定義
    var rankingData:NSMutableArray = NSMutableArray()
    var rankNumber: Int = 0
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init(coder aDecoder: NSCoder?) {
        super.init(coder: aDecoder!)
    }
    
    @IBAction func loadData(){
        //初期化
        rankingData.removeAllObjects()
        
        //タイムライン用のクエリを定義
        var findRankingData: PFQuery = PFQuery(className: "ranking_table_after_sort")
        
        //クエリで取得したデータに対しての処理
        findRankingData.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.rankingData.addObject(object)
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
            //NSArray型にいったん格納して順番をリバースさせる
//            let array: NSArray = self.rankingData.reverseObjectEnumerator().allObjects
//            self.rankingData = NSMutableArray(array: array)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
//        self.title = "Ranking"
        //Title画像
        let image = UIImage(named: "rank_360-1.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 180, 20)
        imageView.sizeThatFits(CGSize(width: 180, height: 20))
        self.navigationItem.titleView = imageView
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        //        println("a")
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return rankingData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.separatorColor = UIColor.clearColor()//境界線の色を変更
        
        let cell:RankingTableViewCell = (tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RankingTableViewCell)
        let rank:PFObject = (self.rankingData.objectAtIndex(indexPath.row) as! PFObject)
        
        cell.rankNum.alpha = 0
        cell.rankName.alpha = 0
        cell.rankStep.alpha = 0
        cell.rankMark.alpha = 0
//        cell.contentView.alpha = 0
        cell.backgroundView?.alpha = 0
        
        //textViewに情報を表示
        var num = (rank.objectForKey("rank") as? String)
        cell.rankName.text = (rank.objectForKey("usrname") as? String)
        cell.rankStep.text = (rank.objectForKey("today_steps") as? String)
        cell.rankNum.text = num
        cell.rankMark.text = ">"
        //CreatedAtの表示
//        var dateFormatter: NSDateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd HH:mm"
//        cell.timestampLabel.text = dateFormatter.stringFromDate(done.createdAt!)
        
        //PFUserオブジェクトでUserのクエリを作成→wherekeyをdoneのobjectIdに設定→
//        var findDonner:PFQuery = PFUser.query()!
//        findDonner.whereKey("objectId", equalTo: (done.objectForKey("doner")!.objectId)!!)//donerがユーザーテーブルに紐付いている
//        findDonner.findObjectsInBackgroundWithBlock{
//            (objects: [AnyObject]?, error: NSError?) -> Void in
//            if error == nil {
//                if let objects = objects as? [PFUser] {
//                    let user:PFUser = objects.last!
//                    cell.usernameLabel.text = user.username//ユーザーネームの表示
//                    //表示アニメーション
//                    UIView.animateWithDuration(0.5, animations: {
//                        cell.doneTextView.alpha = 1
//                        cell.usernameLabel.alpha = 1
//                        cell.timestampLabel.alpha = 1
//                    })
//                }
//            } else {
//                println("Error: \(error!) \(error!.userInfo!)")
//            }
//        }
        
        UIView.animateWithDuration(0.5, animations: {
            cell.rankNum.alpha = 1
            cell.rankName.alpha = 1
            cell.rankStep.alpha = 1
            cell.rankMark.alpha = 1
        })
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        //        println("c")
        return true
    }

}
