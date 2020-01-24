//
//  SignupView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/23.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    @State var mailaddress: String = ""
    @State var password: String = ""
    @State var username: String = ""
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            VStack{
            Image("コンサドーレ5")
                Text("⚽️新規登録⚽️")
                    .fontWeight(.heavy)
                    .font(.title)
                TextField("お名前", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("メールアドレス", text: $mailaddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                //                Text(mailaddress)
                SecureField("パスワード", text:  $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Text("登録完了！")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.title)
                    .frame(width:330, height: 80)
                    .background(Color.black)
                    .cornerRadius(12)
                    .offset(y:20)
                Spacer()
                
            }
        }
    }
}

//struct SignupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignupView()
//    }
//}
