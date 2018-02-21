//
//  StoreCell.swift
//  GenKart
//
//  Created by Farhan Ali on 15/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

class StoreCell: UITableViewCell {

    @IBOutlet var StoreName: UILabel!
    @IBOutlet var StoreImage: UIImageView!
    
    @IBOutlet var Icon: UIImageView!
    
   
    @IBOutlet var miles: UILabel!
    
    @IBOutlet var Address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
    
}
