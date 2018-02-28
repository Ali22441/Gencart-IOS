//
//  myOrderDropDownSubTableViewCell.swift
//  webMark8Project
//
//  Created by Mazhar Hussain on 26/2/18.
//  Copyright © 2018 Mazhar Hussain. All rights reserved.
//

import UIKit

class myOrderDropDownSubTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemNumberLabel: UILabel!
    
    @IBOutlet weak var seNoLabel: UILabel!

    @IBOutlet weak var priseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
