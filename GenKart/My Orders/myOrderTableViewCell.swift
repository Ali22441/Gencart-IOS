//
//  myOrderTableViewCell.swift
//  webMark8Project
//
//  Created by Mazhar Hussain on 23/2/18.
//  Copyright © 2018 Mazhar Hussain. All rights reserved.
//

import UIKit

class myOrderTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    
    @IBOutlet weak var orderNo: UILabel!
    
    @IBOutlet weak var totalBill: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
}
