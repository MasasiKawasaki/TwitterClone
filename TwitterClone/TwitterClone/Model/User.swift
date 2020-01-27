//
//  User.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/24.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

class User{
    var uid: String
    var displayname: String
    var email: String
    
    init(uid: String, displayName: String, email: String) {
        self.uid = uid
        self.displayname = displayName
        self.email = email
    }
}
