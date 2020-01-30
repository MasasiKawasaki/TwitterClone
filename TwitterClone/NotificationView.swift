//
//  NotificationView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/29.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    
    var rewardAd: Rewarded = Rewarded()
    
    var body: some View {
    Button(action: {
        self.rewardAd.showAd(rewardFunction: {
          print("報酬が貰えました")
        })
    }) {
        Text("報酬型広告を表示")
    }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
