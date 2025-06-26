//
//  AuthorView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 04.03.2025.
//

import SwiftUI

struct AuthorView: View {
    let author: AuthorModel
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.thirdcolor, lineWidth: 1.5)
                .background(Color.white)
                .frame(width: 186, height: 200)
                .padding(.horizontal, 1)
            
            VStack {
                AuthorImageView(authorImage: author.authorImage, authorName: author.authorName, authorFollowers: author.authorFollowers)
            }
        }
    }
}

struct AuthorImageView: View {
    let authorImage: String
    let authorName: String
    let authorFollowers: String
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            ZStack (alignment: .top) {
                Image(authorImage)
                    .resizable()
                    .frame(width: 135, height: 135)
                
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 23, height: 23)
                    .rotationEffect(.degrees(90))
                    .padding(.leading, 136)
            }.padding(.top, 4)
            Text(authorName)
                .font(Font.custom("Roboto-SemiBold", size: 14))
                .foregroundStyle(.mainaccent)
            Text(authorFollowers)
                .font(Font.custom("Roboto-Regular", size: 12))
                .foregroundStyle(.mainsecondary)
        }
        
    }
}










//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView(viewModel: PostViewModel())
//        }
//    }
// тсарая штука которая


//#Preview {
//    AuthorView(author: AuthorModel)
//}
