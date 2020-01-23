//
//  ProfileImageView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/22.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image(systemName: "person")
        .resizable()
//        .scaleToFit()
        .frame(width: 35, height: 35)
        .clipShape(Circle())
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
