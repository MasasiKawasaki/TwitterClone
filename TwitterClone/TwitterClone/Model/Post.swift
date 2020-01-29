//
//  Post.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/21.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct Post: Identifiable {
    
    var id : String
    var text : String
    var username: String
    var tag: String
    var commentsNum: Int
    var likesNum: Int
    var postImage: String
    var documentId: String
    
    
    init(id: String, text: String, username: String, tag: String, commentsNum: Int, likesNum: Int,
         postImage: String, documentId: String = "") {
           self.id = id
           self.text = text
           self.username = username
           self.tag = tag
           self.commentsNum = commentsNum
           self.likesNum = likesNum
           self.postImage = postImage
           self.documentId = documentId
    }
}

//struct Post_Previews: PreviewProvider {
//    static var previews: some View {
//        Post()
//    }
//}
