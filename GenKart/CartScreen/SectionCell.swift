//
//  SectionCell.swift
//  GenKart
//
//  Created by Farhan Ali on 27/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

class SectionCell: UITableViewCell {
    @IBOutlet var imageLogo: UIImageView!
    
    
    @IBOutlet var personGroceryStore: UILabel!
    
    @IBOutlet var PriseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
