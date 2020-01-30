//
//  Rewarded.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/29.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
import UIKit
    
class Rewarded: NSObject, GADRewardedAdDelegate{
    
    //GADRewardedAdのインスタンスを生成
    //テスト用のIDを設定しておく
    var rewardedAd:GADRewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
    
    var rewardFunction: (() -> Void)? = nil
    
    override init() {
        super.init()
        LoadRewarded()
    }
    
    func LoadRewarded(){
        let req = GADRequest()
        self.rewardedAd.load(req)
    }
    
    func showAd(rewardFunction: @escaping () -> Void){
        if self.rewardedAd.isReady{
            self.rewardFunction = rewardFunction
            let root = UIApplication.shared.windows.first?.rootViewController
            self.rewardedAd.present(fromRootViewController: root!, delegate: self)
        }
       else{
           print("Not Ready")
       }
    }
    
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        if let rf = rewardFunction {
            rf()
        }
    }
    
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
        self.rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
        LoadRewarded()
    }
}
//struct Rewarded_Previews: PreviewProvider {
//    static var previews: some View {
//        Rewarded()
//    }
//}
