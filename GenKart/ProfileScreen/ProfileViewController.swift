//
//  ProfileViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 10/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit
import SwiftyJSON



class ProfileViewController: UIViewController {
    
    
    
    @IBOutlet var ProfileImage: UIImageView!
   
    @IBOutlet var EmailLbl: UILabel!
    
    @IBOutlet var PhoneLbl: UILabel!
    
    @IBOutlet var AddressLbl: UILabel!
    
    @IBOutlet var ZipCodeLbl: UILabel!
    
    @IBOutlet var RoleLbl: UILabel!
    
    @IBOutlet var CartIdLbl: UILabel!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
         GetProfile()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProfileImage.layer.borderWidth = 1
        self.ProfileImage.layer.masksToBounds = false
        self.ProfileImage.layer.borderColor = UIColor.black.cgColor
        self.ProfileImage.layer.cornerRadius = self.ProfileImage.frame.height/2
        self.ProfileImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BackPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeNVC") as! HomeNavController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        let currentTopVC: UIViewController? = self.currentTopViewController()
        currentTopVC?.present(vc, animated: false, completion: nil)
        
        
    }

    
    
    
    
    
    
    //Get user profile from server
    
    func GetProfile(){
       
        let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/profile")! as URL)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(usertokenn)", forHTTPHeaderField: "Authorization")

        
            let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
            if error != nil {
                print("error=\(error)")
                return
            }
                
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    
                print("responseString = \(responseString!)")

            // Convert server json response to NSDictionary
                
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary) != nil {
                    
                    
                   let json = JSON(data!)
                
                   if json["success"].exists(){
                        
                        
                        let email = json["success"]["email"].stringValue
                        let phone = json["success"]["phone"].stringValue
                        let address = json["success"]["address"].stringValue
                        let Zipcode = json["success"]["zipcode"].stringValue
                        let role = json["success"]["role"].stringValue
                        let cartid = json["success"]["cart_session_id"].stringValue
                        
                        DispatchQueue.main.async {
                            
                            self.EmailLbl.text = "Email:\(email)"
                            
                            self.PhoneLbl.text = "Phone:\(phone)"
                            
                            self.AddressLbl.text = address
                            
                            self.ZipCodeLbl.text = Zipcode
                            
                            self.RoleLbl.text = role
                            
                            self.CartIdLbl.text = cartid
                        
                        }
                    
                    }
                    
                    else {
                        
                        print("Error occurred")
                        
                        
                    }
       
                }

                
            }
  
            catch let error as NSError {
                print(error.localizedDescription)
                
            }
      
        }

        task.resume()

    }
    

    
    
    
    //Return the current top view controller
    
    
    func currentTopViewController() -> UIViewController {
        var topVC: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
        while ((topVC?.presentedViewController) != nil) {
            topVC = topVC?.presentedViewController
        }
        return topVC!
    }
    
    
}
