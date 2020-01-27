//
//  SignupView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/23.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
   
    @State var showModal: Bool = false
    @State var showAlert = false
    @State var isError: Bool = false
    @State var errorText: String = ""
    
    @EnvironmentObject var userStore: UserStore
//    @EnvironmentObject var userStore: UserStore
    func signUp(){
        userStore.signUp(email: email, password: password) { (result, error) in
               if error != nil {
                   self.isError = true
                   self.errorText = error?.localizedDescription ?? "nil"
               } else {
                   let changeRequest = result?.user.createProfileChangeRequest()
                   changeRequest?.displayName = self.username
                   changeRequest?.commitChanges(completion: { (error) in
                       if let error = error {
                           debugPrint(error.localizedDescription)
                       }
                   })
                let user = User(uid: result?.user.uid ?? "", displayName: result?.user.displayName ?? "", email: result?.user.email ?? "")
                self.userStore.setData(user: user)
                
                self.username = ""
                self.email = ""
                self.password = ""
    }
    }
    }
    
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
                TextField("メールアドレス", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                //                Text(mailaddress)
                SecureField("パスワード", text:  $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action:{
                    print("✋新規登録完了")
                    self.signUp()
                    if self.username.isEmpty{
                        self.isError.toggle()
                    } else if self.email.isEmpty{
                         self.errorText = "お名前が入力されていません"
                    }
                    else if self.email.isEmpty {
                            self.isError.toggle()
                            self.errorText = "メールアドレスが入力されていません"
                        } else if self.password.isEmpty {
                            self.isError.toggle()
                            self.errorText = "パスワードが入力されていません"
                        } else {
                            
                        }
                    }
                ,label:{
                Text("登録完了！")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.title)
                    .frame(width:330, height: 80)
                    .background(Color.black)
                    .cornerRadius(12)
                    .offset(y:20)
                }
                )
                Spacer()
            }
        }.alert(isPresented: $isError, content: {
            Alert(title: Text("エラー"), message: Text(self.errorText), dismissButton: .default(Text("OK")))
        })
    }
}

//struct SignupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignupView()
//    }
//}
