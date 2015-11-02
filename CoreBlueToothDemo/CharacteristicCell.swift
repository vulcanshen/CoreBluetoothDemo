//
//  ServiceCellTableViewCell.swift
//  CoreBlueToothDemo
//
//  Created by kutai on 2015/11/2.
//  Copyright © 2015年 shenyun. All rights reserved.
//

import UIKit

class CharacteristicCell: UITableViewCell {

    @IBOutlet weak var lbUUID: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbProp: UILabel!
    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbPropHex: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
