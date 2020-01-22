//
//  FeedView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/21.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI
import Firebase
import struct Kingfisher.KFImage
struct FeedView: View {
    
    @ObservedObject var postStore = PostStore()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(postStore.posts, id: \.id){ post in
                        PostRow(post: post)
                    }
                }
               
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action:{print("😆投稿ボタンがクリックされました")})
                        {Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding()
                        }
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    }.padding()
                }
            }
            .navigationBarTitle("Home")
            .navigationBarItems(trailing: Button(action: {
                print("ログアウトメソッド")
            }) {
                Text("Sign Out")
            })
        }.onAppear(perform: {
            self.postStore.posts.removeAll()
            self.postStore.fetch()
        })
}
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}
