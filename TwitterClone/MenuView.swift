//
//  MenuView.swift
//  TwitterClone
//
//  Created by Kawasaki Masasi on 2020/01/30.
//  Copyright © 2020 Kawasaki Masasi. All rights reserved.
//
import Foundation
import SwiftUI

struct MenuView: View {
    
    @ObservedObject var userState : UserState
    @EnvironmentObject var userStore: UserStore

    var body: some View {
        
        VStack(alignment: .leading){
            HStack(alignment: .top){
              HeaderMenu()
            }.padding(.bottom, 10)
            VStack(alignment: .leading){
                HStack{
        Button(action: {
            self.userState.isMenuOpen.toggle()
        })
                    {
                        HStack{
                            Image(systemName: "person")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            
                            Text("Profile")
                            .font(Font.system(size: 20))
                            .fontWeight(.heavy)
                            .padding(.leading, 10)
                            .foregroundColor(.black)
                        }
                    }
                }.padding(.top, 25)
            }
            Spacer()
        }.padding(.leading, 40)
        
    }


struct HeaderMenu: View {
    
    @EnvironmentObject var userStore: UserStore
    
    var body: some View{
        
        VStack(alignment: .leading){
            Image(systemName: "person")
            .resizable()
            .frame(width: 45, height: 45)
            .clipShape(Circle())
            Text("\(self.userStore.user?.displayname ?? "")")
            .font(Font.system(size: 20))
            .fontWeight(.black)
            Text("@\(self.userStore.user?.uid ?? "")")
            .font(.subheadline)
            .foregroundColor(.gray)
            
          HStack{
            Text("260")
            .font(.headline)
            Text("following")
            .font(.headline)
            .foregroundColor(.gray)
            Text("300")
            .font(.headline)
            Text("followers")
            .font(.headline)
            .foregroundColor(.gray)
            
            }
        }
        
    }
}
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
