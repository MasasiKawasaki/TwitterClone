//
//  SplashView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/23.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    @State var isLogin: Bool = false
     @EnvironmentObject var userStore: UserStore
    
    func getUser(){
        userStore.listen()
    }
    
    var body: some View {
        Group {
              if(userStore.user != nil) {
                ContentView()
            } else {
                LoginView()
            }
        }.onAppear(perform: getUser)
    }
}

//struct SplashView_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashView()
//    }
//}
