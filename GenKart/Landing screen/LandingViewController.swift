//
//  LandingViewController.swift
//  GenKart
//
//  Created by Farhan Ali on 13/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit
import AlertTransition
 var RoletypeStr = ""

class LandingViewController: UIViewController,AlertFrameProtocol {

      var alertFrame: CGRect { return UIScreen.main.bounds }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func customerPressed(_ sender: Any) {
    
    RoletypeStr = "for Customer"
        
        movetologin()
    
    }
    
    
    @IBAction func OwnerPressed(_ sender: Any) {
        
        RoletypeStr = "for Owner"
             movetologin()
        
    }
    
    func movetologin(){
        
       
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.present(vc, animated: false, completion: nil)
        
    }
    
    
    

}
