//
//  LoginViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 08/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit
import Foundation
import TwitterKit

import FBSDKLoginKit
import SwiftyJSON

var fgEmail = ""
var tusername = ""
var usertokenn = ""
var userrName = ""
class LoginViewController: UITableViewController {
    
    
    @IBOutlet var RoletypeLabel: UILabel!
    
    

         var dict : [String : AnyObject]!
    @IBOutlet var NameField: UITextField!
    
    @IBOutlet var tv: UITableView!
    
    @IBOutlet var PasswordField: UITextField!
    
    @IBOutlet var LoadingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       tv.backgroundView = UIImageView(image: UIImage(named: "BG"))
        
     
        
        RoletypeLabel.text = RoletypeStr
        
        LoadingView.isHidden = true
       
    }

  
  
    
    @IBAction func LoginPressed(_ sender: Any) {
        
        view.endEditing(true)
        LoginCall()
        
        
    }
    
    
    
    
    
    
    

    @IBAction func RegisterPressed(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpViewController
        
        
        
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        present(vc, animated: false, completion: nil)
        
        
        
        
    }
    
    
    
    // Login Method
    
    func LoginCall(){
        
        
        LoadingView.isHidden = false
        
        
        //Http request to api
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/login"
            )! as URL)
        request.httpMethod = "POST"
        let postString = "email=\(NameField.text!)&password=\(PasswordField.text!)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        //  let task = URLSession.shared.dataTask(with: request as URLRequest) {
        // data, response, error in
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
            if error != nil {
                print("error=\(String(describing: error!))")
                return
            }
            
            print("response = \(String(describing: data!))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //
            print("responseString = \(String(describing: responseString!))")
            
            
            
            
            // Convert server json response to NSDictionary
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary) != nil {
                    
                    
                    
                    let json = JSON(data!)
                    
                    
                    
                    if json["success"].exists(){
                        
                        
                        userrName = json["success"]["name"].stringValue
                        
                        usertokenn = json["success"]["token"].stringValue
                        
                        
                        
                        DispatchQueue.main.async {
                            
                               self.LoadingView.isHidden = true
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LandingTabController") as! LandingTabController
                            
                            
                            
                            
                            let transition = CATransition()
                            transition.duration = 0.5
                            transition.type = kCATransitionPush
                            transition.subtype = kCATransitionFromRight
                            self.view.window!.layer.add(transition, forKey: kCATransition)
                          
                            
                            
                            let currentTopVC: UIViewController? = self.currentTopViewController()
                            
                            currentTopVC?.present(vc, animated: false, completion: nil)
                            
                            
                        }
                        
                        
                        
                    }
                        
                    else
                    {
                       
                          DispatchQueue.main.async {
                        
                           self.LoadingView.isHidden = true
                        
                        let alert = UIAlertController(title: "GenKart", message: "Invalid Credentials. Please try again", preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        
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
    
    //Login Method Ends here
    
    
    
    
    @IBAction func forgot(_ sender: Any) {
        
        let alertController = UIAlertController(title: "GenKart", message: "Enter your email to reset password.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = "Email"
            
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            
            
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            
            let tf = alertController.textFields![0]
            
            fgEmail = tf.text!
            
            print(fgEmail)
            self.forgotEmail()
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    func forgotEmail(){
        
        
        
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/password/email"
            )! as URL)
        request.httpMethod = "POST"
        let postString = "email=\(fgEmail)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        //  let task = URLSession.shared.dataTask(with: request as URLRequest) {
        // data, response, error in
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            // print("response = \(data)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //
            //  print("responseString = \(responseString)")
            
            
            
            // Convert server json response to NSDictionary
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary) != nil {
                    
                    
//
//                    let json = JSON(data!)
//
//
//
//                    if json["sucess"].exists(){
//
//
//
//
//
//                        if json["msg"].exists(){
//
//
//
//                            EmailExist =  json["msg"].stringValue
//
//
//                            print(EmailExist)
//
//
//
//                        }
//
//
//
//                        else {
//
//
//                            print("xx")
//                        }
//
//
//
//
//
//                    }
//
//
                    
                        
                        
                        
                        
                        
//                    else {
//
//
//                        print("xx")
//
//                    }
//
//
//
//
                    
                    
                    DispatchQueue.main.async {
                        
                        
                        //self.LoadingView.isHidden = true
                        
                        let alert = UIAlertController(title: "GenKart", message: "An A password reset link has sent to your email. ", preferredStyle: UIAlertControllerStyle.alert)
                        let SuccessAlert = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler: nil)
                        
                        alert.addAction(SuccessAlert)
                        
                        
                        let currentTopVC: UIViewController? = self.currentTopViewController()
                        
                        currentTopVC?.present(alert, animated: false, completion: nil)
                        
                        
                    }
                    
                   
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
            
                
                //print(status)
                //print(reason)
                
                
            }
                
                
                
                
            catch let error as NSError {
                print(error.localizedDescription)
                
            }
            
            
            
            
            
            
            
            
            
            
        }
        
        
        task.resume()
        
        
        
        
        
    }
    
   
    
    @IBAction func fblogin(_ sender: Any) {
        
        
        
    //    let checkvalue = UserDefaults.standard.value(forKey: "UserLogin") as! String
        
        
      //  if (checkvalue == "1"){
            
            
            
          //  self.performSegue(withIdentifier: "HomeVC", sender: nil)
            
            
            
       // }
            
      //  else {
            
            
            
            
            
            
            
            let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
            fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
                if (error == nil){
                    let fbloginresult : FBSDKLoginManagerLoginResult = result!
                    if fbloginresult.grantedPermissions != nil {
                        if(fbloginresult.grantedPermissions.contains("email"))
                        {
                            self.getFBUserData()
                            // fbLoginManager.logOut()
                            
                            print("Sucess")
                            
                            self.performSegue(withIdentifier: "ToHome", sender: nil)

                            
                            
                        }
                    }
                    
                    
                    
                    
                }
            }
            
       // }
        
    }
    
    
    
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email,location"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                   // keyy = "1"
                    
                 //   UserDefaults.standard.set(keyy, forKey: "UserLogin")
                    
                }
            })
        }
    }

    
    
    
    
    @IBAction func TwitterLogin(_ sender: Any) {
        
        
      //  let checkval = UserDefaults.standard.value(forKey: "TwitterLogin") as! String
        
        
        
       // if checkval == "1"{
            
            
            
         //   self.performSegue(withIdentifier: "HomeVC", sender: nil)
            
            
            
            
            
        //}
            
            
            
            
     //   else{
            
            
            
            
            
            
            
            TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
                if (session != nil) {
                    print("signed in as \(String(describing: session?.userName))")
                    
                    tusername = (session?.userName)!
                  //  print(session?.us)
                    
                    self.loadTwitterProfile()
                    
                   // self.performSegue(withIdentifier: "ToHome", sender: nil)
                    
                 //   UserDefaults.standard.set("1", forKey: "TwitterLogin")
                    
                    
                } else {
                    print("error: \(String(describing: error?.localizedDescription))")
                }
            })
            
       // }
        
    }
    
    
    
    
    func loadTwitterProfile(){
        
        
        // print(bson[0])
        // print(json[1])
        // print(json[2])
        
        //   print(json[0]["entities"]["media"].arrayValue.map({$0["media_url_https"].stringValue}))
        
        //   DispatchQueue.main.async {
        
        
        
        let client = TWTRAPIClient()
        let statusesShowEndpoint = "https://api.twitter.com/1.1/users/show.json?"
        let params = ["screen_name": tusername,]
        var clientError : NSError?
        
        
      let request = client.urlRequest(withMethod: "GET", urlString: statusesShowEndpoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError!)")
            }
            
            //  do {
            // let json = try JSONSerialization.jsonObject(with: data!, options: [])
            
            let json = JSON(data!)
            
            print(json)
            
           
        }
    }
    
    
    
    
    
}
