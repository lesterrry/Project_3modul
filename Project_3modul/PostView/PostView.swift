//
//  PostView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 03.03.2025.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.thirdcolor, lineWidth: 1.5)
                .background(Color.white)
                .frame(width: 390, height: 280)
                .padding(.horizontal, 1)
            
            VStack {
                HeaderView(title: post.title)
    
                ImagesView(images: post.images, circleTextTop: post.circleTextTop, circleTextBottom: post.circleTextBottom)
                
                UserInfoView(userImage: post.userImage, userName: post.userName, userFollowers: post.userFollowers, likesCount: post.likesCount, commentsCount: post.commentsCount, viewModel: UserInfoViewModel(userID: 0, lifetime: 0))
            }
        }
    }
}


struct HeaderView: View {
    let title: String
    
    var body: some View {
        
        HStack {
            Text(title)
                .font(Font.custom("Roboto-Bold", size: 20))
                .padding(.leading, 36)
            Spacer()
            Image(systemName: "ellipsis.circle")
                .resizable()
                .frame(width: 23, height: 23)
                .rotationEffect(.degrees(90))
                .padding(.trailing, 36)
        }
    }
}

struct ImagesView: View {
    let images: [String]
    let circleTextTop: String
    let circleTextBottom: String
    
    var body: some View {
        HStack (spacing: -72) {
            ForEach(images, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .frame(width: 168, height: 168)
            }
            
            CircleView(topText: circleTextTop, bottomText: circleTextBottom)
        }
    }
}

struct CircleView: View {
    let topText: String   // не понимаю эти две пременные
    let bottomText: String // зачем они, если есть circleTextTop и ниж.
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.mainaccent, lineWidth: 1.5)
                .background(Color.white)
                .mask(Circle())
                .frame(width: 168, height: 168)
                .padding(.leading, 1)
            
            VStack {
                Text(topText)
                    .font(Font.custom("Roboto-Regular", size: 16))
                Image("arrow")
                    .resizable()
                    .frame(width: 18, height: 10)
                Text(bottomText)
                    .font(Font.custom("Roboto-Regular", size: 16))
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PostViewModel())
    }
}
