//
//  ViewController.swift
//  Ad test
//
//  Created by VIGNESH on 08/04/21.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,GADFullScreenContentDelegate  {
    
    private var interstitial: GADInterstitialAd?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("started")

//        loadAd()
        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector:#selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
           
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
      print("Ad did fail to present full screen content.")
    }

    /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did present full screen content.")
    }

    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did dismiss full screen content.")
        
//        loadAd()
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
                                interstitial?.present(fromRootViewController: self)
    }
)
        

    }
    
    @objc func appMovedToForeground() {
    print("App moved to foreground!")
        loadAd()
    }
    
    @IBAction func click(_ sender: Any) {
        
        loadAd()
        
    }
    

}

