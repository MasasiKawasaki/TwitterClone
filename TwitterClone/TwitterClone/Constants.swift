//
//  Constants.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import Foundation


struct Constants {
    //Firestore: CollectionName
    static let posts = "posts"
    
    static let users = "users"

    static let userId = "userId"
    static let email = "email"
    static let name = "username"
    
    //Firestore: FieldName
    static let id = "id"
    static let text = "text"
    static let username = "username"
    static let tag = "tag"
    static let likesNum = "likesNum"
    static let commentsNum = "commentsNum"
    static let postImage = "postImage"
    static let timestamp = "timestamp"
    static let pics = "pics"
    
    static let comments = "comments"
//    頭にCをつけるのはコメントコレクションの中のものだから
    static let cId = "id"
    static let cUserId = "userId"
    static let cUserName = "userName"
    static let cComment = "comment"
    
}
