//
//  CreatePost.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct CreatePost: View {
    @ObservedObject var postStore = PostStore()
    @State var txt: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showImagePicker = false
    @State var picData: Data = .init(count: 0)
    
    var body: some View {
        VStack{
        HStack{
            Button(action: {
                print("キャンセルボタンをタップ")
                self.presentationMode.wrappedValue.dismiss()
            }){Text("Cancel")}
            Spacer()
            
            Button(action: {
                self.showImagePicker.toggle()
            }) {
                Image(systemName: "photo.fill")
                    .resizable()
                    .frame(width: 30, height: 25)
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.blue)
                    .padding(.horizontal, 6)
            }
            Button(action: {
                    print("投稿ボタンタップ")
                
                self.postStore.uploadToStorage(picData: self.picData) { url in
                let post = Post(id: NSUUID().uuidString, text: self.txt, username: "G's seattle", tag: "@novel", commentsNum: 5, likesNum: 32, postImage: url)
                    self.postStore.post(post: post)
                }
                self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Tweet")
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        Divider()
        TextView(text: $txt)
        Spacer()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(picker: self.$showImagePicker, picData: self.$picData)
            }
        .padding()
        
    }
}

struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        CreatePost()
    }
}
