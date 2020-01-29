//
//  CommentStore.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/28.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import Foundation
import Firebase

class CommentStore: ObservableObject {
    
    var db = Firestore.firestore()

    @Published var comments = [Comment]()
    
    func fetchComments(documentId: String) {
        db.collection(Constants.posts).document(documentId).collection(Constants.comments).addSnapshotListener() { (querySnapshot, error) in
            if let _error = error {
                print("Error getting docs: \(_error)")
            } else {
                querySnapshot!.documentChanges.forEach { diff in
                    if (diff.type == .added) {
                        
                        print("\(diff.document.documentID) => \(diff.document.data())")
                        
                        let data = diff.document.data()
                        
                        guard let _id = data[Constants.cId] as? String else { return }
                        guard let _comment = data[Constants.cComment] as? String else { return }
                        guard let _userId = data[Constants.cUserId] as? String else { return }
                        guard let _userName = data[Constants.cUserName] as? String else { return }
                        
                        let comment = Comment(id: _id, comment: _comment, userId: _userId , userName: _userName)
                        
                        DispatchQueue.main.async {
                            self.comments.append(comment)
                            
                            
                        }
                    }
                }
            }
        }
    }
    func postComment(documentId: String, comment: Comment) {
        db.collection(Constants.posts).document(documentId).collection(Constants.comments).document().setData([
            Constants.cId: comment.id,
            Constants.cComment: comment.comment,
            Constants.cUserId: comment.userId,
            Constants.cUserName: comment.userName,
        ]) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
        }
    }

}
