//
//  ContentView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/21.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var bounds = UIScreen.main.bounds
    
    @ObservedObject var userState = UserState()
//    ObservleをしたときはやるときはObservedにする
    
    var body: some View {
//    とじカッコは開いたらすぐ閉じる
    ZStack {
        Rectangle()
//        出てくるグレーの箱をRectangleという
        .foregroundColor(.gray)
//         Bool値がtrue: opacityが0.5にセット。false: 0がセット
        .opacity(self.userState.isMenuOpen ? 0.5 : 0)
        .offset(x: self.userState.isMenuOpen ? bounds.width - 60 : 0)
//            　　　　　　　　　　　　　　　　　　演算子の場合は空白を入れるのが基本
//            　　　　　　　　　　　　　　　　　　?はifと同じ意味になっている
        .zIndex(self.userState.isMenuOpen ? 10 : -10)
//        zIndexで奥行きを表現できる
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
        
       TabView {
        FeedView(userState: self.userState)
               .tabItem {
                   Image(systemName: "house")
                   Text("Home")
               }
       
             SearchView()
               .tabItem {
                   Image(systemName: "magnifyingglass")
                   Text("Search")
               }
                   
           NotificationView()
               .tabItem {
                   Image(systemName: "bell")
                   Text("Notifications")
               }
                   
           Text("チャット画面")
               .tabItem {
                   Image(systemName: "envelope")
                   Text("Messages")
           }
       }
       .accentColor(.blue)
       .edgesIgnoringSafeArea(.top)
       .offset(x: self.userState.isMenuOpen ? bounds.width - 60 : 0)
       .animation(.default)
        MenuView(userState: self.userState)
        .offset(x: self.userState.isMenuOpen ? -60 : -bounds.width)
        .animation(.default)
        
        
       }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
