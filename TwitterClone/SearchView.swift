//
//  SearchView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/29.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    var interstitial: Interstitial = Interstitial()
    
    var body: some View {
        Button(action: {
            //ボタンが押されたら、showAdファンクションを実行
            self.interstitial.showAd()
        })
        {
        Text("全画面広告を表示")
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
