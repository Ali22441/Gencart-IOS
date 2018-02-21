//
//  ItemDetailViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 17/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet var ScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ScrollView.isDirectionalLockEnabled = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x>0 {
            scrollView.contentOffset.x = 0
        }
    }

    
    
    //Collection View
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
       
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemDetailCell", for: indexPath) as! ItemsCollectionCell
            
            
            cell.ItemImage.image = UIImage(named:"Rolex")
            
            cell.ItemName.text = "Pen Box."
            cell.ItemDescription.text = "Pen Box Description.."
            
            cell.ItemPrice.text = "300 SR"
            
            cell.ItemQuantity.text = "0"
            
            return cell
            
            
            
            
        
    }
    
    
}
