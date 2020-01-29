//
//  Comment.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/28.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

//import Foundation

struct Comment: Identifiable {
    
    var id: String
    var comment: String
    var userId: String
    var userName: String
    
    init(id: String, comment: String, userId: String, userName: String) {
        self.id = id
        self.comment = comment
        self.userId = userId
        self.userName = userName
    }
    
    #if DEBUG
    static let example = Comment(id: "", comment: "", userId: "", userName: "")
    #endif
}
