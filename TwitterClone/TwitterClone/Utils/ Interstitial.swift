//
//   Interstitial.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/29.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI
import UIKit
import GoogleMobileAds

class Interstitial: NSObject, GADInterstitialDelegate{
    
//    GADInterstitialのインスタンスを生成
    var interstitial:GADInterstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    
    override init() {
        super.init()
        //クラスのインスタンス生成時に、広告コンテンツがロードされるようにしておく
        //動画のため、ロードに時間がかかるため、事前ロードする
        //定義した関数を実行
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        //広告を取得するためのGADRequest()のインスタンスを生成
        let req = GADRequest()
        //広告をロードする
        self.interstitial.load(req)
        //GADInterstitialDelegateを継承したので、自分自身をdelegateにセット
        //InterstitialとGADInterstitialDelegateを繋げる役目
        self.interstitial.delegate = self
    }
    
    func showAd(){
        //もし、広告がロードされていたら、広告画面をModalで表示
        if self.interstitial.isReady {
           let root = UIApplication.shared.windows.first?.rootViewController
           self.interstitial.present(fromRootViewController: root!)
        }
       else {
           print("😆広告はまだロードされていません")
       }
        
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        //画面からいなくなったら、再度広告コンテンツをロードする
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        LoadInterstitial()
    }
}


