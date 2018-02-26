//
//  myOrdersViewController.swift
//  webMark8Project
//
//  Created by Mazhar Hussain on 23/2/18.
//  Copyright © 2018 Mazhar Hussain. All rights reserved.
//

import UIKit

class myOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var popUpView: UIView!
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    @IBOutlet weak var popUpTabelView: UITableView!
    

    
    var arrayLabelText = ["Mr.Person's Grocery Store", "Amuk Pharmacy", "Name Super Shop", "Mac Donuld's"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 3
        
        popUpView.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if tableView == mainTableView {
            return 5
        } else {
            return arrayLabelText.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == mainTableView{
            return 60
        } else {
            return 50
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == mainTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myOrderTableViewCell") as! myOrderTableViewCell
            
            let radius: CGFloat = cell.mainView.frame.width / 2.0 //change it to .height if you need spread for height
            let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: cell.mainView.frame.height))
            //Change 2.1 to amount of spread you need and for height replace the code for height
            
            cell.mainView.layer.cornerRadius = 2
            cell.mainView.layer.shadowColor = UIColor.lightGray.cgColor
            cell.mainView.layer.shadowOffset = CGSize(width: -7, height: -8)  //Here you control         cell.mainView.layer.shadowOpacity = 0.5
            cell.mainView.layer.shadowRadius = 2.0 //Here your control your blur
            cell.mainView.layer.masksToBounds =  false
            cell.mainView.layer.shadowPath = shadowPath.cgPath
            
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myOrderPopUpTableViewCell") as! myOrderPopUpTableViewCell
            let radius: CGFloat = cell.mainView.frame.width / 2.0 //change it to .height if you need spread for height
            let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: cell.mainView.frame.height))
            //Change 2.1 to amount of spread you need and for height replace the code for height
            
            cell.mainView.layer.cornerRadius = 2
            cell.mainView.layer.shadowColor = UIColor.lightGray.cgColor
            cell.mainView.layer.shadowOffset = CGSize(width: -7, height: -8)  //Here you control         cell.mainView.layer.shadowOpacity = 0.5
            cell.mainView.layer.shadowRadius = 2.0 //Here your control your blur
            cell.mainView.layer.masksToBounds =  false
            cell.mainView.layer.shadowPath = shadowPath.cgPath
            
            
            cell.labelText.text = arrayLabelText[indexPath.row]
            return cell
            
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        
        popUpView.isHidden = true
    }
    
    @IBAction func rightButtonPop(_ sender: Any) {
        
        popUpView.isHidden = false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
