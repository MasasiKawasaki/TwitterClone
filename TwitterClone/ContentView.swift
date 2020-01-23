//
//  ContentView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/21.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       TabView {
        FeedView()
        
               .tabItem {
                   Image(systemName: "house")
                   Text("Home")
               }
           Text("検索画面")
               .tabItem {
                   Image(systemName: "magnifyingglass")
                   Text("Search")
               }
                   
           Text("通知画面")
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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
