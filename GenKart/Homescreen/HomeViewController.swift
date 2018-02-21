//
//  HomeViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 09/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit
import GooglePlacePicker
import GoogleMaps
import SwiftyJSON
import AlertTransition
//import GoogleMapsCore
var lati = ""
var longi = ""



var StoreNames = [String]()
var StoreAddress = [String]()
var StoreUpdated_at = [String]()
var Storelat_long = [String]()
var Storeplace_id = [String]()
var StoreBanner = [String]()
var Storezipcode = [String]()
var StoreStatus = [String]()
var Store_id = [String]()
var StoreSlug = [String]()
var StoreCreated_at = [String]()
var StorePhone = [String]()
var StoreLogo = [String]()





//
//{
//    "name" : "test",
//    "updated_at" : "2018-01-22 04:43:21",
//    "address" : "Riyadh, Riyadh Province, Saudi Arabia",
//    "lat_long" : "33.488979, 73.103532",
//    "place_id" : "e3bdcf038b9378042607c1a17742b4968b8d7d9a",
//    "banner" : null,
//    "zipcode" : "11564",
//    "status" : "0",
//    "id" : 1,
//    "slug" : "test",
//    "created_at" : "2018-01-22 04:43:21",
//    "phone" : "123456789123",
//    "logo" : null
//}













class HomeViewController: UIViewController {
    @IBOutlet var UsernameLbl: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       UsernameLbl.text = "HomePage \(RoletypeStr)"
        
     GetStoresList()
 
       // navigationController?.navigationBar.barTintColor = UIColor.green

    }

    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
    @IBAction func LogoutPressed(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        
        
        
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        
        
        let currentTopVC: UIViewController? = self.currentTopViewController()
        
        currentTopVC?.present(vc, animated: false, completion: nil)
        
        
    }
    
    
    @IBAction func ProfilePressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileNVC") as! ProfileNavController
        
        
        
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        
        
        let currentTopVC: UIViewController? = self.currentTopViewController()
        
        currentTopVC?.present(vc, animated: false, completion: nil)
        
        
        
        
    }
    
    
    
    
    
    
    func currentTopViewController() -> UIViewController {
        var topVC: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
        while ((topVC?.presentedViewController) != nil) {
            topVC = topVC?.presentedViewController
        }
        return topVC!
    }
  
    
    
    @IBAction func pickPlace(_ sender: UIButton) {
        let center = CLLocationCoordinate2D(latitude: 33.5317, longitude: 73.1188)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
       // let circleCenter : CLLocationCoordinate2D = CLLocationCoordinate2DMake(33.5317, 73.1188);
        
        
        
        let circ = GMSCircle(position: center, radius: 16093.4)
        circ.fillColor = UIColor(red: 0.0, green: 0.7, blue: 0, alpha: 0.1)
        circ.strokeColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 0.5)
        circ.strokeWidth = 2.5;
        
        
        
        
        
        placePicker.pickPlace(callback: {(place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                
                print(place.coordinate.longitude)
                print(place.coordinate.latitude)
                
               // UserDefaults.standard.set(place.coordinate.longitude, forKey: "long")
               // UserDefaults.standard.set(place.coordinate.latitude, forKey: "lat")
                
               // UserDefaults.standard.set(place.name, forKey: "location")
                
                
                
                //  let str = place.name.components(separatedBy: ",")
                
                self.nameLabel.text = place.formattedAddress
                
                
               // UserDefaults.standard.set(place.formattedAddress, forKey: "Address")
                
                let str = place.formattedAddress?.components(separatedBy: ", ")
                
                
                self.addressLabel.text = str?.last
                
                UserDefaults.standard.set(str?.last, forKey: "Country")
                
                
            } else {
                self.nameLabel.text = "No place selected"
                self.addressLabel.text = ""
            }
        })
    }
    
    
    func GetStoresList(){
    

        StoreNames.removeAll()
        StoreAddress.removeAll()
        StoreUpdated_at.removeAll()
        Storelat_long.removeAll()
        Storeplace_id.removeAll()
        StoreBanner.removeAll()
        Storezipcode.removeAll()
        StoreStatus.removeAll()
        Store_id.removeAll()
        StoreSlug.removeAll()
        StoreCreated_at.removeAll()
        StorePhone.removeAll()
        StoreLogo.removeAll()
        
    
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/stores")! as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(usertokenn)", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            // print("response = \(data)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //
          //  print("responseString = \(responseString!)")
            
            // Convert server json response to NSDictionary
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary) != nil {
                    
                    
                    let json = JSON(data!)
                    

                    let showresponse = json["success"][0]
                    
                //    print(showresponse)
                    
                    
                    for i in 0...json["success"].count-1{
                    
                       // print(json["success"][i])
                        
                        let base = json["success"][i]
                        
                        let name = base["name"].stringValue
                        
                        StoreNames.append(name)
                
                    }
                    
                    
                    
                    
                    
                }
                
            }
                
                
            catch let error as NSError {
                print(error.localizedDescription)
                
            }
            
            
            
            
            
            
            
            
            
            
        }
        
        
        task.resume()
        
        
        
        
        
    }
    
    
    @IBAction func didTapButton2(_ sender: AnyObject) {
        PopupController
            .create(self)
            .customize(
                [
                    .animation(.slideUp),
                    .scrollable(false),
                    .backgroundStyle(.blackFilter(alpha: 0.7))
                ]
            )
            .didShowHandler { popup in
                print("showed popup!")
            }
            .didCloseHandler { _ in
                print("closed popup!")
            }
            .show(DemoPopupViewController2.instance())
    }
    
  
    
}


    

    
    
    

