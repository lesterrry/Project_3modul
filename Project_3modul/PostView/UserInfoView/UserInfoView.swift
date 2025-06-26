//
//  UserInfoView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 25.06.2025.
//

import SwiftUI

struct UserInfoView: View {
    let userImage: String
    let userName: String
    let userFollowers: String
    let likesCount: String
    let commentsCount: String
    
    init(userImage: String, userName: String, userFollowers: String, likesCount: String, commentsCount: String,  viewModel: UserInfoViewModel) {
        self.userImage = userImage
        self.userName = userName
        self.userFollowers = userFollowers
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.viewModel = viewModel
    }
    @ObservedObject var viewModel: UserInfoViewModel
    
    var body: some View {
        HStack {
        //
            HStack  {
                Image(userImage)
                    .resizable()
                    .frame(width: 30, height: 30)
                
                VStack (alignment: .leading) {
                    Text(userName)
                        .font(Font.custom("Roboto-Medium", size: 14))
                    Text(userFollowers)
                        .font(Font.custom("Roboto-Regular", size: 12))
                }
                Spacer()
            }
           
            HStack(spacing: 5) {
                Image(viewModel.isLiked ? "hearticonfill" : "hearticon")
                    .resizable()
                    .frame(width: 23, height: 23)
                    .onTapGesture {
                        if viewModel.isLiked {
                            viewModel.unlike()
                        } else {
                            viewModel.loadLike()
                        }
                    }
                Text(likesCount)
                    .font(Font.custom("Roboto-Regular", size: 12))
                Image("messageicon")
                    .resizable()
                    .frame(width: 23, height: 23)
                    .padding(.leading, 4)
                Text(commentsCount)
                    .font(Font.custom("Roboto-Regular", size: 12))
            } .padding(.trailing, 36) 
        }.padding(.leading, 36)
        .padding(.top, 6)
    }
}
