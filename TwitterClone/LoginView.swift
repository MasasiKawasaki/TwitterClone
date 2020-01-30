//
//  LoginView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/23.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var showModal: Bool = false
    
    @State var showAlert = false
    @State var isError: Bool = false
    @State var errorText: String = ""
    
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
    
    @EnvironmentObject var userStore: UserStore
    
    func signIn() {
        userStore.signIn(email: email, password: password) { (result, error) in
            if error != nil {
                self.isError.toggle()
                self.errorText = error?.localizedDescription ?? "nil"
                print(error?.localizedDescription ?? "nil")
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
//        NavigationView{
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
                TextField("メールアドレス", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
//                Text(mailaddress)
                SecureField("パスワード", text:  $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
//                Text(password)
//                Spacer()
                Button(action: {
                    print("Button tapped")
                    if self.email.isEmpty {
                        self.isError.toggle()
                        self.errorText = "メールアドレスが入力されていません"
                    } else if self.password.isEmpty {
                        self.isError.toggle()
                        self.errorText = "パスワードが入力されていません"
                    } else {
                        self.signIn()
                    }
                },label: {Text("ログイン")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.title)
                    .frame(width:330, height: 80)
                    .background(Color.black)
                    .cornerRadius(12)
                }
            )
                Button(action: {
                    // action
                    self.showModal.toggle()
                },label: { Text("新規登録はこちら")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.title)
                    .frame(width:330, height: 80)
                    .background(Color.black)
                    .cornerRadius(12)}
                ).offset(y:20)
//                    Text("Don't have an account? Sign up)
                //                }
            .navigationBarTitle(Text("ログイン"))
                Spacer()
//            }
        }
        }.alert(isPresented: $isError, content: {
                Alert(title: Text("エラー"), message: Text(self.errorText), dismissButton: .default(Text("OK")))
            })
            .sheet(isPresented: self.$showModal) {
                SignupView().environmentObject(self.userStore)
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
