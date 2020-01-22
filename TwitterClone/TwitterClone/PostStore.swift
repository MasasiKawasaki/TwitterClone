//
//  PostStore.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/21.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import Foundation
import Firebase


class PostStore: ObservableObject{
    
    var db = Firestore.firestore()
    
    @Published var posts = [Post]()
//    これからまだ入るデータがあるからPostで定義する
    func fetch(){
        db.collection(Constants.posts).addSnapshotListener()
            {  (querySnapshot, error)
                in
                if let _error = error {print("Error getting docs:\(_error)")
                } else {
                    querySnapshot!.documentChanges.forEach {diff in
                        if (diff.type == .added){
                        let data = diff.document.data()
                        
                        guard let _id = data[Constants.id] as? String else {return}
                        guard let _text = data[Constants.text] as? String else {return}
                        guard let _username = data[Constants.username] as? String else {return}
                        guard let _tag = data[Constants.tag] as? String else {return}
                        guard let _likesNum = data[Constants.likesNume] as? Int else {return}
                        guard let _commentsNum = data[Constants.commentsNume] as? Int else{return}
                            
                        let post = Post(id: _id, text: _text, username: _username, tag: _tag, commentsNum: _commentsNum, likesNum: _likesNum)
//                            Postの順番に作らないといけない
//                            if let を使うときなどに＿を使う
                        DispatchQueue.main.async{
                            self.posts.append(post)
                        }
                        }
                        }
                }
//    Constantsのっていうpostsというのを呼び出している
//     Collectionは一番外の箱の名前
        
    }
}
}
