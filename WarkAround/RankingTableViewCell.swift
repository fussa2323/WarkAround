//
//  RankingTableViewCell.swift
//  WarkAround
//
//  Created by Yohei Fusayasu on 6/7/15.
//  Copyright (c) 2015 Tachikoma. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var rankNum: UILabel!
    @IBOutlet weak var rankName: UILabel!
    @IBOutlet weak var rankStep: UILabel!
    @IBOutlet weak var rankMark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
