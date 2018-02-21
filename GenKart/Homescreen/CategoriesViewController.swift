//
//  CategoriesViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 15/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var ColView: UICollectionView!
    
    @IBOutlet var ItemDetailView: UIView!
    
    @IBOutlet var StoreBtn: UIButton!
    
    @IBOutlet var StoreBar: UIImageView!
    
    @IBOutlet var StoreDetailView: UIView!
    
    @IBOutlet var ItemBar: UIImageView!
    
    @IBOutlet var Tv: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ItemDetailView.isHidden = true
        var CollectionViewsize = (self.view.frame.width - 16)
        StoreDetailView.isHidden = true
        
        ItemBar.isHidden = true
         ColView.isHidden = true
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func StoreBtn(_ sender: Any) {
        
        StoreDetailView.isHidden = true
        ItemDetailView.isHidden = true
        ItemBar.isHidden = true
        StoreBar.isHidden = false
        ColView.isHidden = true
        Tv.isHidden = false
        
    }
    
    
    @IBAction func ItemBtn(_ sender: Any) {
          ItemDetailView.isHidden = true
        StoreBar.isHidden = true
        ItemBar.isHidden = false
        Tv.isHidden = true
        ColView.isHidden = false
    }
    
    
    //Categories Section
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
   
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreCell
        
        cell.StoreName.text = "PUNJAB CASH AND CARRY"
        cell.StoreImage.image = UIImage(named: "Beautiful")
        cell.Address.text = "G-9 Markaz Islamabad near PSO patrol pump"
        cell.Icon.image = UIImage(named: "store icon")
        cell.miles.text = "100 miles"
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 245
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        StoreDetailView.isHidden = false
        
        
    }
    
    
    
    //Items Section
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView.tag == 2{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell2", for: indexPath) as! ItemsCollectionCell
        
            
            cell.ItemImage.image = UIImage(named:"pen box")
            
            cell.ItemName.text = "Pen Box."
            cell.ItemDescription.text = "Pen Box Description.."
            
            cell.ItemPrice.text = "300 SR"
            
            cell.ItemQuantity.text = "0"
            
            return cell
            
            
            
            
        }
        
        else {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemsCollectionCell
        
        
        cell.ItemImage.image = UIImage(named:"Strawberry juice")
        
        cell.ItemName.text = "Strawberry juice"
        cell.ItemDescription.text = "made from fresh.."
        
        cell.ItemPrice.text = "300 SR"
        
        cell.ItemQuantity.text = "0"
        
        return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView.tag == 2 {
            
            print("YOYOY")
            
            
        }
        
        
        else{
            
            ItemDetailView.isHidden = false
            
            
            
        }
        
        
    }
    
    
    
    
    
}
