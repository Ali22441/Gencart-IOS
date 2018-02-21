//
//  EditProfileVC.swift
//  GenKart
//
//  Created by Farhan Ali on 10/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit
import Photos
import SwiftyJSON

 var base = ""
 var img: UIImageView!

class EditProfileVC: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var LoadingView: UIView!
    
    @IBOutlet var ProfileImage: UIImageView!

    @IBOutlet var NameTf: UITextField!

    @IBOutlet var PhoneTf: UITextField!
    
    @IBOutlet var ZipcodeTf: UITextField!
    
    
    
    
    var imagePicker = UIImagePickerController()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadingView.isHidden = true
        imagePicker.delegate = self
        checkPermission()
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

    @IBAction func EditUserPressed(_ sender: Any) {
        
        img = ProfileImage
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if imagePicker.allowsEditing {
            
            img.image = info[UIImagePickerControllerEditedImage] as? UIImage }
        else {
            img.image  = info[UIImagePickerControllerOriginalImage] as? UIImage
        }

        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
    }

    
    @IBAction func SavePressed(_ sender: Any) {
        // Save user profile
        view.endEditing(true)
        LoadingView.isHidden = false
        updateProfile()
    }

    @IBAction func UpdatePressed(_ sender: Any) {
        view.endEditing(true)
           LoadingView.isHidden = false
        updateProfile()

    }
    
    // Update profile method

    func updateProfile(){
        
        LoadingView.isHidden = false
        
        let jpegCompressionQuality: CGFloat = 0.9 // Set this to whatever suits your purpose
        if let base64String = UIImageJPEGRepresentation(self.ProfileImage.image!, jpegCompressionQuality)?.base64EncodedString() {
            
            // Upload base64String to your database
            
            print(base64String)
            base = base64String
        }
 
     
        let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/update_profile"
            )! as URL)

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(usertokenn)", forHTTPHeaderField: "Authorization")
        
        let postString = "name=\(NameTf.text!)&phone=\(PhoneTf.text!)&zipcode=\(ZipcodeTf.text!)&image=\(base)"
        request.httpBody = postString.data(using: String.Encoding.utf8)

        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            // print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(String(describing: responseString))")
            
            
            // Convert server json response to NSDictionary
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary) != nil {
                    
                    // Print out dictionary
                    //print(convertedJsonIntoDict)
                    
                    
                    let json = JSON(data!)
                    
                    if json["success"].exists(){
       
                        DispatchQueue.main.async {
                            
                            // ALert for Success response from server
                            
                            let alert = UIAlertController(title: "GenKart", message: "Your Profile has been updated Sucessfully.", preferredStyle: UIAlertControllerStyle.alert)
                            
                            let success = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
                                UIAlertAction in
                                
                               // self.view.endEditing(true)
                                
                                self.LoadingView.isHidden = true
                                
                            }
                            
                            alert.addAction(success)
                            
                            
                            let currentTopVC: UIViewController? = self.currentTopViewController()
                            
                            currentTopVC?.present(alert, animated: false, completion: nil)
              
                        }
     
                    }
                        
                    else{
                        
                        // alert after failure response from server
                        
                        let alert = UIAlertController(title: "GenKart", message: "Error occurred while updating profile. Please Try again", preferredStyle: UIAlertControllerStyle.alert)
                        
                        
                        
                        let failure = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
                            UIAlertAction in
                            
                            // self.view.endEditing(true)
                            
                            self.LoadingView.isHidden = true
                            
                        }
                        
                        alert.addAction(failure)
                        
                        
                        let currentTopVC: UIViewController? = self.currentTopViewController()
                        
                        currentTopVC?.present(alert, animated: false, completion: nil)
                        
                    }
                    
                    
                    
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
    }
    
    
    
    //checks the permission and asks for camera access
    
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
            
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
    
    

}
