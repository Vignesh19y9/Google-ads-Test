//
//  AppDelegate.swift
//  Ad test
//
//  Created by VIGNESH on 08/04/21.
//

import UIKit
import GoogleMobileAds



@main
class AppDelegate: UIResponder, UIApplicationDelegate, GADFullScreenContentDelegate {

    var window: UIWindow?
    private var interstitial: GADInterstitialAd?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        loadAd()
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        
        print("entered back", application)
         loadAd()
       // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
   }
    
    func loadAd() {
        
        let request = GADRequest()
            GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                                        request: request,
                              completionHandler: { [self] ad, error in
                                if let error = error {
                                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                  return
                                }
                                else{
    
                                }
                                
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                
                                interstitial?.present(fromRootViewController: (self.window?.rootViewController)!)
                                
    }
)
        

    }

}

