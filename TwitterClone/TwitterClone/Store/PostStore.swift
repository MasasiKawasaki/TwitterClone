//
//  PostStore.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/21.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class PostStore: ObservableObject{
    
    var db = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    
    @Published var posts = [Post]()
//    これからまだ入るデータがあるからPostで定義する
    
    func fetch(){
        db.collection(Constants.posts).order(by: Constants.timestamp, descending: true)
            .addSnapshotListener()
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
                        guard let _commentsNum = data[Constants.commentsNum] as? Int else{return}
                        guard let _likesNum = data[Constants.likesNum] as? Int else {return}
                        guard let _postImage = data[Constants.postImage] as? String else{return}
                        guard let _timestamp = data[Constants.timestamp] as? Timestamp else {return}
                        
                        let _date = _timestamp.dateValue()
                        let _documentId = diff.document.documentID
                        let post = Post(id: _id, text: _text, username: _username, tag: _tag, commentsNum: _commentsNum, likesNum: _likesNum, postImage: _postImage, documentId: _documentId, timestamp: _date)
                            
//                            Postの順番に作らないといけない
//                            if let を使うときなどに＿を使う
//                        DispatchQueue.main.async{
                            self.posts.append(post)
//                        }
                        }
                        }
                }
//    Constantsのっていうpostsというのを呼び出している
//     Collectionは一番外の箱の名前
        
    }
}
    
   func post(post: Post) {
           
       db.collection(Constants.posts).document().setData([
           Constants.id: post.id,
           Constants.text: post.text,
           Constants.username: post.username,
           Constants.tag: post.tag,
           Constants.commentsNum: post.commentsNum,
           Constants.likesNum: post.likesNum,
           Constants.postImage: post.postImage,
           Constants.timestamp: post.timestamp
       ]) { (error) in
           if error != nil {
               print(error?.localizedDescription ?? "")
               return
           }
       }
       print("投稿成功！")
   }
    
    func uploadToStorage(picData: Data, completion: @escaping (String) -> Void)  {
        if !picData.isEmpty {
            let imageName = UUID().uuidString
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpeg"
            let imageRef = storageRef.child(Constants.pics).child("\(imageName).jpg")
            imageRef.putData(picData, metadata: metaData) { (metadata, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "nil")
                    return
                }
                imageRef.downloadURL { (url, error) in
                    guard let downloadURL = url?.absoluteString else {
                        print(error?.localizedDescription ?? "")
                        return
                    }
                    completion((downloadURL))
                }
            }
        } else {
            completion((""))
        }
    }
    
    func updateLikes(documentId: String, likesNum: Int) {
        db.collection(Constants.posts).document(documentId).updateData([
            Constants.likesNum: likesNum + 1
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    func delete(documentId: String){
        db.collection(Constants.posts).document(documentId).delete() {
            err in  if let err = err{
                print("Error removing document: \(err)")
            } else{
                print("Document successfully removed!")
            }
        }
    }
    
}
