//
//  PostRowButton.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct PostRowButton: View {
    var buttonImage: String
    var count: Int
    
    var body: some View {
        HStack(alignment: .center){
            Button(action:{
                if self.buttonImage == "bubble.left" {
                    print("✌️コメントボタンタップ")
                } else if self.buttonImage == "return" {
                    print("✊リツイートボタンタップ")
                } else {
                    print("✋いいねボタンタップ")
                }
            })
            { Image(systemName: buttonImage)
            .foregroundColor(.gray)
            }
            Text(String(self.count))
            .foregroundColor(.gray)
            .padding(.horizontal, 3)
        }
    }
}

struct PostRowButton_Previews: PreviewProvider {
    static var previews: some View {
        PostRowButton(buttonImage: "square.and.arrow.up", count: 18)
    }
}
