//
//  SideMenuCell.swift
//  GenKart
//
//  Created by Farhan Ali on 23/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    
    
    @IBOutlet var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
