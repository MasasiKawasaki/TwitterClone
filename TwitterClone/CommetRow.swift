//
//  CommetRow.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/28.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct CommentRow: View {
    
    var comment: Comment
    
    var body: some View {
        VStack(alignment: .leading){
                Text(comment.userName)
                    .fontWeight(.bold)
                Text("@\(comment.userId)")
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
            Text(comment.comment)
                .padding(.vertical, 6)
        }
    }
}


//struct CommetRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CommetRow()
//    }
//}
