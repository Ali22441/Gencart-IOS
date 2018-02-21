//
//  AppDelegate.swift
//  GenKart
//
//  Created by Farhan Ali on 08/02/2018.
//  Copyright © 2018 EBMACS. All rights reserved.
//

import UIKit

import FBSDKLoginKit

import TwitterKit
import TwitterCore
import GooglePlaces
import GooglePlacePicker
import GoogleMaps
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        GMSPlacesClient.provideAPIKey("AIzaSyBnxMFb469mgT4cWOR0gfxcwK7UbbNW6go")
        
        
        GMSServices.provideAPIKey("AIzaSyBnxMFb469mgT4cWOR0gfxcwK7UbbNW6go")
                 TWTRTwitter.sharedInstance().start(withConsumerKey:"ecHWVLNJmuVmHTMqe7grby1Xb", consumerSecret:"Glfsdp0i4AWnfkHCE5qJcFV4WD5vUdY2bflK6ssvIrfEQVi0F3")
        
                return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        
        
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

