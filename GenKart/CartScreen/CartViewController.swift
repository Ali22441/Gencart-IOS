//
//  CartViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 17/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var Tv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CartSectionCell", bundle: nil)
        Tv.register(nib, forHeaderFooterViewReuseIdentifier: "CartSectionCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        // Here, we use NSFetchedResultsController
        // And we simply use the section name as title
       // let currSection = fetchedResultsController.sections?[section]
       // let title = currSection!.name

        
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CartSectionCell") as! CartSectionCell
        
        
        // Dequeue with the reuse identifier
       // let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CartSectionCell") as! CartSectionCell
      //  let header = cell as! CartSectionCell
      //  header.titleLabel.text = title

        return cell

    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 61
//
//    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 61
    }
    
//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        
        let separator = UIView(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 1))
        
     
        separator.backgroundColor = UIColor.white
        cell.contentView.addSubview(separator)
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }

}
