//
//  StoreController.swift
//  GenKart
//
//  Created by Farhan Ali on 22/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit


//var str = ["1","2","3"]
var storeNames = ["Hyper Mart","Levi's","Bonanza","Denim","Outfitters"]
var Distance = ["20 miles", "30 miles", "25 miles", "15 miles", "10 miles"]

var ratings = ["3.4 rating","5.0 rating","2.4 rating","1.4 rating","2.5 rating"]


class StoreController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storeNames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell2", for: indexPath) as! StoreCell2
        
        
        cell.img.image = UIImage(named: "Rolex")
        
        cell.storeName.text = storeNames[indexPath.row]
        cell.Distance.text = Distance[indexPath.row]
        cell.Ratings.text = "Ratings: \(ratings[indexPath.row])"
        cell.Status.text = "open"
        
        return cell
    }
    
   
    
    
    
    
}
