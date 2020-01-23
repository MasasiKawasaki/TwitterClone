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
    
    
    var body: some View {
        Group {
            if isLogin {
                ContentView()
            } else {
                LoginView()
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
