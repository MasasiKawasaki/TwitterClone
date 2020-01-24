//
//  LoginView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/23.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var mailaddress: String = ""
    @State var password: String = ""
    @State var username: String = ""
    
    var body: some View {
        NavigationView{
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack{
//                Spacer()
                Image("コンサドーレ3")
                .resizable()

                .frame(width:400, height: 300)
//                    .background(Color.red)
//                Spacer()
                Text("⚽️ログイン情報⚽️")
                .fontWeight(.heavy)
                .font(.title)
                TextField("メールアドレス", text: $mailaddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
//                Text(mailaddress)
                SecureField("パスワード", text:  $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
//                Text(password)
//                Spacer()
                NavigationLink(destination: SignupView()){
                Text("新規登録はこちら")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.title)
                    .frame(width:330, height: 80)
                    .background(Color.black)
                    .cornerRadius(12)
                    .offset(y: 20)
                }.navigationBarTitle(Text("ログイン"))
                Spacer()
                
            }
        }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
