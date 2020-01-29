//
//  BannerAdView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/28.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
import UIKit

struct BannerAdView: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeLargeBanner)

        let viewController = UIViewController()
        //サンプルなので、本番環境は自分のに変える
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeLargeBanner.size)
        view.load(GADRequest())
        //広告をロードしている
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

//struct BannerAdView_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerAdView()
//    }
//}
