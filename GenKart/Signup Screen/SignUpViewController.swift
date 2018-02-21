//
//  SignUpViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 08/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit
import SwiftyJSON

var lat = "24.7136"
var long = "46.6753"
var RoleType = "Customer"

class SignUpViewController: UITableViewController {

    @IBOutlet var LoadingView: UIView!
    
   // @IBOutlet var SegmentControl: UISegmentedControl!
    
    @IBOutlet var RoletypeLabel: UILabel!
    

    @IBOutlet var Name: UITextField!
    
    @IBOutlet var PhoneLbl: UITextField!
    
    @IBOutlet var emailTf: UITextField!
    
    @IBOutlet var Password: UITextField!
    
    @IBOutlet var tv: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        tv.backgroundView = UIImageView(image: UIImage(named: "BG"))
    RoletypeLabel.text = RoletypeStr
      LoadingView.isHidden = true
    
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Signup button pressed
    
    
    @IBAction func SignUpPressed(_ sender: Any)
       {
        
        view.endEditing(true)
        
        SignupCall()
        
        }
    
    //Segment Control changed (Driver or customer)
//
//    @IBAction func indexChanged(_ sender: Any)
//    {
//
//
//        switch SegmentControl.selectedSegmentIndex
//        {
//        case 0:
//            RoleType = "Customer"
//        default:
//            RoleType = "Driver"
//        }
//
//
//     }
    
// Signup Method
    
    func SignupCall(){
        
        
        LoadingView.isHidden = false
        
        
        //Http request to api
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/register"
            )! as URL)
        request.httpMethod = "POST"
//        let postString = "name=\(NameField.text!)&email=\(EmailField.text!)&address=\(AddressField.text!)&zipcode=\(ZipCodeField.text!)&place_id=\(PlaceIDField.text!)&lat=\(lat)&long=\(long)&password=\(PasswordField.text!)&phone=\(PhoneNoField.text!)&password_confirmation=\(ConfirmPasswordField.text!)&role=\(RoleType)"
        //  request.httpBody = postString.data(using: String.Encoding.utf8)
        
        //  let task = URLSession.shared.dataTask(with: request as URLRequest) {
         // data, response, error in
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
            if error != nil {
                print("error=\(error!)")
                return
            }
            
            print("response = \(data!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //
            print("responseString = \(responseString!)")
            
            
            
            
            // Convert server json response to NSDictionary
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary) != nil {
                    
                
                    
                    let json = JSON(data!)
                    
                    
                    
                    if json["success"].exists(){
                        
                        
                       let name = json["success"]["name"].stringValue
                        
                        let usertoken = json["success"]["token"].stringValue
                       
                        
                        
                        DispatchQueue.main.async {
                            
                            
                            self.LoadingView.isHidden = true
                            
                            let alert = UIAlertController(title: "GenKart", message: "You've sucessfully signed up. Login to continue..", preferredStyle: UIAlertControllerStyle.alert)
                            let SuccessAlert = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
                                UIAlertAction in
                                
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
                                
                                let transition = CATransition()
                                transition.duration = 0.5
                                transition.type = kCATransitionPush
                                transition.subtype = kCATransitionFromRight
                                self.view.window!.layer.add(transition, forKey: kCATransition)
                                self.present(vc, animated: false, completion: nil)
                                
                            }
                            
                            alert.addAction(SuccessAlert)
                            
                            
                            let currentTopVC: UIViewController? = self.currentTopViewController()
                            
                            currentTopVC?.present(alert, animated: false, completion: nil)
   
                            
                        }
                        
                    
                        
                    }
                        
                    else
                    {
                       
                        DispatchQueue.main.async {
                            
                            self.LoadingView.isHidden = true
                            
                            let alert = UIAlertController(title: "GenKart", message: "An Error Occurred. Please try again", preferredStyle: UIAlertControllerStyle.alert)
                            
                            
                            
                            let failure = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
                                UIAlertAction in
                                
                                // self.view.endEditing(true)
                                
                                
                                
                            }
                            
                            alert.addAction(failure)
                            
                            
                            let currentTopVC: UIViewController? = self.currentTopViewController()
                            
                            currentTopVC?.present(alert, animated: false, completion: nil)
                            
                            
                            
                        }
     
                    }
                    
  
                    
                    
                }
            
                
            }
                

                
            catch let error as NSError {
                print(error.localizedDescription)
                
            }

            
            
        }
        
        
        task.resume()
 
        
    }
    
    //Signup Method Ends here
    
    
    
    
    @IBAction func AlreadyRegistered(_ sender: Any) {
    
    
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.present(vc, animated: false, completion: nil)
    
    }
    
    
    
    
}

extension UITableViewController {
    
    
    func currentTopViewController() -> UIViewController {
        var topVC: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
        while ((topVC?.presentedViewController) != nil) {
            topVC = topVC?.presentedViewController
        }
        return topVC!
    }
    
}


