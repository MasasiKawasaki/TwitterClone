//
//  PostRow.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.

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
    
    @ObservedObject var postStore = PostStore()
//    インスタンスを実体化するときに使う
    
    var body: some View {
        NavigationLink(destination: CommentView(post: post)) {
            VStack(alignment: .leading) {
            HStack(alignment: .top) {
                ProfileImageView()
                VStack(alignment: .leading) {
                    HStack {
                        Text(post.username)
                            .fontWeight(.bold)
                        Text("@\(post.tag)")
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
                Button(action: {
                self.postStore.delete(documentId:self.post.documentId)
//                    かっこは関数を呼び出している
                })
                { Image(systemName:"ellipsis")
                 .foregroundColor(.gray)
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
