//
//  ProfileView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 03.03.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    let post2 = Post(
        title: "эры тейлор свифт",
        images: ["tailorimage1", "tailorimage2"],
        circleTextTop: "Fearless",
        circleTextBottom: "Dead Poets",
        userImage: "personphotoevgeniy",
        userName: "Евгений Топников",
        userFollowers: "937 подписчиков",
        likesCount: "1,8 тыс.",
        commentsCount: "147"
    );
    
    let post3 = Post(
        title: "путешествие в выпускном классе",
        images: ["arinatimeline1", "arinatimeline2"],
        circleTextTop: "2024",
        circleTextBottom: "2025",
        userImage: "personphotoarina",
        userName: "Арина Артамонова",
        userFollowers: "609 подписчиков",
        likesCount: "1,1 тыс.",
        commentsCount: "83"
    );
    
    let post4 = Post(
        title: "лето 2025 — евротур",
        images: ["vasilisaimage1", "vasilisaimage2"],
        circleTextTop: "Белград",
        circleTextBottom: "Афины",
        userImage: "personphotovasilisa",
        userName: "Василиса Сивуч",
        userFollowers: "896 подписчиков",
        likesCount: "1 тыс.",
        commentsCount: "57"
    )
    
    var body: some View {
        
        
        NavigationStack {
            
            ScrollView {
                
                HStack (spacing: 40) {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.mainaccent)
                            .padding()
                    }
                    
                    Text("профиль")
                        .foregroundStyle(.mainaccent)
                        .font(Font.custom("Roboto-ExtraBold", size: 30))
                        .padding(.leading, 28)
                    
                    HStack {
                    Image("editeicon")
                        .resizable()
                        .frame(width: 37, height: 37)
                       
                    
                        NavigationLink(destination: SettingsView()) {
                            Image("settingsicon")
                                .resizable()
                                .frame(width: 37, height: 37)
                        }
                    }
                }

                
                
                ZStack {
                    
                    Circle()
                        .stroke(Color.mainsecondary, lineWidth: 1.5)
                        .background(Color.mainaccent)
                        .mask(Circle())
                        .frame(height: 390)
                    
                    Circle ()
                        .stroke(Color.mainsecondary, lineWidth: 1.5)
                        .background(Color.mainaccent)
                        .mask(Circle())
                        .frame(height: 363)
                    
                    Image("profilephoto")
                        .resizable()
                        .frame(width: 153, height: 153)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.white, lineWidth: 1.5)
                        )
                    
                    VStack {
                        Text("istam rakhimov")
                            .foregroundStyle(.white)
                            .font(Font.custom("Roboto-SemiBold", size: 22))
                            .padding(.top, 234)
                            .padding(.bottom, 0.5)
                        
                        Text("256 подписчиков")
                            .foregroundStyle(.white)
                            .font(Font.custom("Roboto-Regular", size: 14))
                        
                    }
                }
                .padding(.bottom, 40)
                
                VStack (alignment: .leading) {
                    Text("популярные таймлайны")
                        .font(Font.custom("Roboto-ExtraBold", size: 30))
                        .padding(.bottom, 10)
                        .padding(.leading, 20)
                    
                    NavigationLink(destination: DonutView(vm: DonutVM())) {
                        PostView(post: post2)
                            .padding(.bottom, 14)
                    }
                    .buttonStyle(.plain)
                    
                    PostView(post: post3)
                        .padding(.bottom, 14)
                    PostView(post: post4)
                        .padding(.bottom, 14)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.thirdcolor, lineWidth: 1.5)
                        .background(Color.white)
                        .frame(width: 390, height: 280)
                    
                    Image("plusicon")
                        .resizable()
                        .frame(width: 55, height: 55)
        
                     
                }
                .padding(.bottom, 30)
                
                BottomTextView()
                
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    ProfileView()
}
