//
//  StoreController.swift
//  GenKart
//
//  Created by Farhan Ali on 22/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit


protocol MenuActionDelegate {
    func openSegue(_ segueName: String, sender: AnyObject?)
    func reopenMenu()
}


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
    
    
    var interactor = Interactor()
    
    @IBAction func openMenu(_ sender: AnyObject) {
        performSegue(withIdentifier: "openMenu2", sender: nil)
    }
    
    
    
    
    @IBAction func edgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .right)
        
        MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
                self.performSegue(withIdentifier: "openMenu2", sender: nil)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? MenuViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor
            destinationViewController.menuActionDelegate = self
        }
        
        
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier:
            "StoreInside") as! StoreInsideController
        
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        
        
        present(vc, animated: false, completion: nil)
        
    }
   
    
    
    
    
}
extension StoreController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentMenuAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissMenuAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}

extension StoreController : MenuActionDelegate {
    func openSegue(_ segueName: String, sender: AnyObject?) {
        dismiss(animated: true){
            self.performSegue(withIdentifier: segueName, sender: sender)
        }
    }
    func reopenMenu(){
        performSegue(withIdentifier: "openMenu2", sender: nil)
    }
}
