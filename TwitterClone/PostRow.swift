//
//  PostRow.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage
struct PostRow: View {
    var post: Post
    func isExist() -> Bool {
        if self.post.postImage != "" {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationLink(destination: CommentView(post: post)) {
            VStack(alignment: .leading){
            HStack(alignment: .top) {
                ProfileImageView()
                VStack(alignment: .leading){
                    HStack {
                        Text(post.username)
                            .fontWeight(.bold)
                        
                        Text("@\(post.tag)")
//                        Text(userStore.userId)
                            .foregroundColor(.gray)
                    }
                    Text(post.text)
                        .padding(.top, 2)
                    if isExist() {
                        KFImage(URL(string: post.postImage))
                            .resizable()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding(5)
                    }
                }
            }
            HStack {
                Spacer()
                PostRowButton(buttonImage: "bubble.left", count: post.commentsNum, post: post)
                Spacer()
                PostRowButton(buttonImage: "return", count: 0,post: post)
                Spacer()
                PostRowButton(buttonImage: "suit.heart", count: post.likesNum, post: post)
                Spacer()
            }
            .padding(.top, 2)
            .padding(.bottom, 5)
        }
      }
    }
}
