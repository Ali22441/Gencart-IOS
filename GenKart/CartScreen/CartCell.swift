//
//  CartCell.swift
//  GenKart
//
//  Created by Farhan Ali on 17/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet var ProductImage: UIImageView!
    
    
    @IBOutlet var ProductName: UILabel!
    
    @IBOutlet var ProductDescription: UILabel!
    
    
    @IBOutlet var ProductLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
