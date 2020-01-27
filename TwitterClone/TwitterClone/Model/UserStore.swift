//
//  Usestore.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/24.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import Firebase

class UserStore : ObservableObject{
    var db = Firestore.firestore()
    var handle: AuthStateDidChangeListenerHandle?
    
    @Published var user: User?
    
    func listen (){
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                self.user = User(
                    uid: user.uid,
                    displayName:  user.displayName ?? "",
                    email: user.email ?? "")
            }
            else{
                self.user = nil
            }
        }
    }
    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    @discardableResult
    func signOut () -> Bool{
        do {
            try Auth.auth().signOut()
            self.user = nil
            return true
        } catch {
            return false
        }
    }
   
    func setData(user: User) {
        db.collection(Constants.users).document(user.uid).setData([
            Constants.userId: user.uid,
            Constants.email: user.email,
            Constants.name: user.displayname,
        ])
    }
    

    
}
