//
//  PostRow.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct PostRow: View {
    var post: Post
    var body: some View {
//        VStack(alignment: .leading){
        HStack(alignment: .top) {
            ProfileImageView()
            VStack(alignment: .leading){
                HStack {
                    Text(post.username)
                        .fontWeight(.bold)
                    Text(post.tag)
                        .foregroundColor(.gray)
                }
//            }
                Text(post.text)
                    .padding(.top, 2)
                HStack {
                    Spacer()
                    PostRowButton(buttonImage: "bubble.left", count: post.commentsNum ?? 0)
                    Spacer()
                    PostRowButton(buttonImage: "return", count: 0)
                    Spacer()
                    PostRowButton(buttonImage: "suit.heart", count: post.likesNum)
                    Spacer()
                }
                .padding(.top, 2)
                .padding(.bottom, 5)
            }
        }

    }
}

//struct PostRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PostRow()
//    }
//}
