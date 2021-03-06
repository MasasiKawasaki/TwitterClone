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
    @EnvironmentObject var userStore: UserStore
    
    @ObservedObject var postStore = PostStore()
    @State private var showModal = false
    
    @ObservedObject var userState = UserState()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(postStore.posts, id: \.id){ post in
                        PostRow(post: post)
                    }
                }.buttonStyle(PlainButtonStyle())
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action:{self.showModal = true})
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
            .navigationBarItems(leading:
            Button(action: {
                print("Menu Open")
            self.userState.isMenuOpen.toggle()
            })
                {
                    Text("Menu")
                }
            )
//            .navigationBarItems(trailing: Button(action: {
//                print("ログアウトメソッド")
//                self.userStore.signOut()
//            }) {
//                Text("Sign Out")
//            })
        }.sheet(isPresented: self.$showModal){
            CreatePost()
            .environmentObject(self.userStore)
        }
        .onAppear(perform: {
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
