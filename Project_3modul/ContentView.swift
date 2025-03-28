//
//  ContentView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 03.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    let post1 = Post(
        title: "billie — hit me hard and soft",
        images: ["billieimage1", "billieimage2"],
        circleTextTop: "Skinny",
        circleTextBottom: "Blue",
        userImage: "personphotovictoria",
        userName: "Виктория Земина",
        userFollowers: "1,6 тыс. подписчиков",
        likesCount: "2,5 тыс.",
        commentsCount: "290"
    );
    
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
    );
    
    let author1 = AuthorModel(
        authorImage: "popularauthor1",
        authorName: "aydar n.",
        authorFollowers: "516 подписчиков"
    );
    
    let author2 = AuthorModel(
        authorImage: "popularauthor2",
        authorName: "Захар День",
        authorFollowers: "410 подписчиков"
    );
    
    let author3 = AuthorModel(
        authorImage: "popularauthor3",
        authorName: "Fox N",
        authorFollowers: "324 подписчиков"
    );
    
    let author4 = AuthorModel(
        authorImage: "popularauthor4",
        authorName: "Яна Глухова",
        authorFollowers: "288 подписчиков"
    )
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                VStack (alignment: .leading) {
                    HStack (spacing: 12) {
                        NavigationLink(destination: AboutAppView()) {
                            Image("logodark")
                                .resizable()
                                .frame(width: 85, height: 37)
                                .padding(.leading, 2)
                        }
                        
                        // доделать поиск!!!
                        ZStack (alignment: .leading) {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.mainaccent, lineWidth: 1.5)
                                .background(Color.white)
                                .frame(width: 238, height: 40)
                            
                            Image(systemName: "magnifyingglass")
                                .frame(width: 14, height: 14)
                                .foregroundColor(.mainaccent)
                                .padding(.leading, 18)
                        }
                            
                        NavigationLink(destination: ProfileView()) {
                            Image("profilephoto")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color.mainaccent, lineWidth: 1.5)
                                )
                        }
                        
                        
                    }
                }
                .padding(.top, 4)
                .padding(.bottom, 36)
                
                ZStack {
                    Image("maincircle")
                        .resizable()
                        .frame(width: 390, height: 390)
                    
                    VStack {
                        Text("вся жизнь")
                            .font(Font.custom("PlayfairDisplay-SemiBoldItalic", size: 56))
                        Text("как на ладони")
                            .font(Font.custom("Roboto-SemiBold", size: 18))
                        
                        //NavigationLink
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(.mainsecondary)
                            .frame(width: 144, height: 34)
                            .overlay (
                                Text("создать lapse")
                                    .foregroundStyle(.white)
                                    .font(Font.custom("Roboto-Black", size: 14)))
                            .padding(.top, 18)
                        
                    }.padding(.top, 36)
                }.padding(.bottom, 36)
                
                VStack (alignment: .leading) {
                    Text("популярные таймлайны")
                        .font(Font.custom("Roboto-ExtraBold", size: 30))
                        .padding(.bottom, 10)
                        .padding(.leading, 20)
                    
                    PostView(post: post1)
                        .padding(.bottom, 14)
                    
                    NavigationLink(destination: DonutView(vm: DonutVM())) {
                        PostView(post: post2)
                            .padding(.bottom, 14)
                    }
                    .buttonStyle(.plain)
                    
                    PostView(post: post3)
                        .padding(.bottom, 14)
                    PostView(post: post4)
                        .padding(.bottom, 14)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text("смотреть все")
                                .font(Font.custom("Roboto-Bold", size: 18))
                            Image("arrow")
                                .resizable()
                                .frame(width: 18, height: 10)
                        }
                        .padding(.bottom, 40)
                        
                        Text("популярные авторы")
                            .font(Font.custom("Roboto-ExtraBold", size: 30))
                            .padding(.bottom, 10)
                        
                        
                        Grid (horizontalSpacing: 16, verticalSpacing: 16) {
                            GridRow {
                                AuthorView(author: author1)
                                AuthorView(author: author2)}
                            GridRow {
                                AuthorView(author: author3)
                                AuthorView(author: author4)}
                        }
                        .padding(.bottom, 44)
                        
                        Text("популярные теги")
                            .font(Font.custom("Roboto-ExtraBold", size: 30))
                            .padding(.bottom, 10)
                        
                        VStack {
                            HStack {
                                //NavigationLink
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.thirdcolor, lineWidth: 1.5)
                                    .foregroundColor(.white)
                                    .frame(width: 120, height: 29)
                                    .overlay (
                                        Text("жизнь звезд")
                                            .foregroundStyle(.thirdcolor)
                                            .font(Font.custom("Roboto-Regular", size: 14)))
                                
                                //NavigationLink
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.thirdcolor, lineWidth: 1.5)
                                    .foregroundColor(.white)
                                    .frame(width: 129, height: 29)
                                    .overlay (
                                        Text("личная жизнь")
                                            .foregroundStyle(.thirdcolor)
                                            .font(Font.custom("Roboto-Regular", size: 14)))
                                
                                //NavigationLink
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.thirdcolor, lineWidth: 1.5)
                                    .foregroundColor(.white)
                                    .frame(width: 123, height: 29)
                                    .overlay (
                                        Text("поп-культура")
                                            .foregroundStyle(.thirdcolor)
                                            .font(Font.custom("Roboto-Regular", size: 14)))
                            }
                            HStack {
                                //NavigationLink
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.thirdcolor, lineWidth: 1.5)
                                    .foregroundColor(.white)
                                    .frame(width: 87, height: 29)
                                    .overlay (
                                        Text("музыка")
                                            .foregroundStyle(.thirdcolor)
                                            .font(Font.custom("Roboto-Regular", size: 14)))
                                
                                //NavigationLink
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.thirdcolor, lineWidth: 1.5)
                                    .foregroundColor(.white)
                                    .frame(width: 122, height: 29)
                                    .overlay (
                                        Text("опыт работы")
                                            .foregroundStyle(.thirdcolor)
                                            .font(Font.custom("Roboto-Regular", size: 14)))
                                
                                //NavigationLink
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.thirdcolor, lineWidth: 1.5)
                                    .foregroundColor(.white)
                                    .frame(width: 162, height: 29)
                                    .overlay (
                                        Text("публичные фигуры")
                                            .foregroundStyle(.thirdcolor)
                                            .font(Font.custom("Roboto-Regular", size: 14)))
                            }
                        }.padding(.bottom, 6)
                        HStack {
                            Text("смотреть все")
                                .font(Font.custom("Roboto-Bold", size: 18))
                            Image("arrow")
                                .resizable()
                                .frame(width: 18, height: 10)
                        }
                        .padding(.bottom, 40)
                        
                        TakeEmailView()
                        BottomTextView()
                        
                    }
                    .padding(.leading, 20)
                    
                    
                }
                
                //                Image("bottomtext")
                //                    .resizable()
                //                    .frame(width: 390, height: 18)
                //                    .padding(.top, 44)
                
                
            }
            .scrollIndicators(.hidden)
            .padding(.top, 2)
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        
        
    }
}


#Preview {
    ContentView()
}
