//
//  CommentView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/28.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    @EnvironmentObject var userStore: UserStore
    @ObservedObject var commentStore = CommentStore()
    
    @State var isError: Bool = false
    @State var errorText: String = ""
    var post: Post
    
    @State private var newComment = ""
    
    var body: some View {
//        Sectionは灰色の棒
        List {
            Section(header: Text("What's happening?")) {
                HStack {
                    VStack {
                        TextField("Comment", text: $newComment)
                    }
                    Button(
                        action: {
                            print("コメント投稿されました")
                            if self.newComment.isEmpty {
                            self.isError.toggle()
                            self.errorText = "コメントが入力してください!"
                            }
                           let comment = Comment(id: NSUUID().uuidString, comment: self.newComment, userId: self.userStore.user?.uid ?? "", userName: self.userStore.user?.displayname ?? "")
                            self.commentStore.postComment(documentId: self.post.documentId, comment: comment)
                            self.newComment = ""
                    },label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.purple)
                                .imageScale(.large)
                    })
                }
            }
            .font(.headline)
            Section(header: Text("Comments")) {
                ForEach(commentStore.comments, id: \.id) { comment in
                    CommentRow(comment: comment)
                }
            }
        }.onAppear(perform: {
            DispatchQueue.main.async {
                self.commentStore.comments.removeAll()
                self.commentStore.fetchComments(documentId: self.post.documentId)
            }
        })
        .alert(isPresented: $isError, content: {
            Alert(title: Text("エラー"), message: Text(self.errorText), dismissButton: .default(Text("OK")))
        })
    }
}


//struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentView()
//    }
//}
