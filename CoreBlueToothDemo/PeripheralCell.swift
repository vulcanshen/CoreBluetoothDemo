//
//  PeripheralCellTableViewCell.swift
//  CoreBlueToothDemo
//
//  Created by kutai on 2015/10/30.
//  Copyright © 2015年 shenyun. All rights reserved.
//

import UIKit

class PeripheralCell: UITableViewCell {

    @IBOutlet weak var lbUUID: UILabel!
    @IBOutlet weak var lbRSSI: UILabel!
    @IBOutlet weak var lbConntable: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
