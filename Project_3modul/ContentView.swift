import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PostViewModel
    let posts: [Post] = [
        Post(
            id: 1,
            title: "billie — hit me hard and soft",
            images: ["billieimage1", "billieimage2"],
            circleTextTop: "Skinny",
            circleTextBottom: "Blue",
            userImage: "personphotovictoria",
            userName: "Виктория Земина",
            userFollowers: "1,6 тыс. подписчиков",
            likesCount: "2,5 тыс.",
            commentsCount: "290"
        ),
        Post(
            id: 2,
            title: "эры тейлор свифт",
            images: ["tailorimage1", "tailorimage2"],
            circleTextTop: "Fearless",
            circleTextBottom: "Dead Poets",
            userImage: "personphotoevgeniy",
            userName: "Евгений Топников",
            userFollowers: "937 подписчиков",
            likesCount: "1,8 тыс.",
            commentsCount: "147"
        )
    ]

    let authors: [AuthorModel] = [
        AuthorModel(
            authorImage: "popularauthor1",
            authorName: "aydar n.",
            authorFollowers: "516 подписчиков"
        ),
        AuthorModel(
            authorImage: "popularauthor2",
            authorName: "Захар День",
            authorFollowers: "410 подписчиков"
        ),
        AuthorModel(
            authorImage: "popularauthor3",
            authorName: "Fox N",
            authorFollowers: "324 подписчиков"
        ),
        AuthorModel(
            authorImage: "popularauthor4",
            authorName: "Яна Глухова",
            authorFollowers: "288 подписчиков"
        )
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(spacing: 12) {
                        NavigationLink(destination: AboutAppView()) {
                            Image("logodark")
                                .resizable()
                                .frame(width: 85, height: 37)
//                                .padding(.leading, 2)
                        }
                        .padding(.trailing, 220)
                        
//                        NavigationLink(destination: SearchView()){
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 14)
//                                    .stroke(Color.mainaccent, lineWidth: 1.5)
//                                    .background(Color.white)
//                                    .frame(width: 40, height: 40)
//                                Image(systemName: "magnifyingglass")
//                                    .frame(width: 14, height: 14)
//                                    .foregroundColor(.mainaccent)
//                            }
//                                
//                        }
                        
                        
                        NavigationLink(destination: ProfileView(viewModel: AuthorViewModel())) {
                            
                            Image("userim")
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color.mainaccent, lineWidth: 1.5)
                                )
                        }
                        
                    }
                    
                }
                .padding(.top, 4)
                .padding(.bottom, 6)

                ZStack {
                    Image("maincircle")
                        .resizable()
                        .frame(width: 390, height: 390)
                    VStack {
                        Text("вся жизнь")
                            .font(Font.custom("PlayfairDisplay-SemiBoldItalic", size: 56))
                        Text("как на ладони")
                            .font(Font.custom("Roboto-SemiBold", size: 18))
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(.mainaccent)
                            .frame(width: 180, height: 50)
                            .overlay(
                                Text("создать lapse")
                                    .foregroundStyle(.white)
                                    .font(Font.custom("Roboto-Black", size: 18))
                            )
                            .padding(.top, 14)
                    }
                    .padding(.top, 40)
                }
                .padding(.bottom, 36)

                VStack(alignment: .leading) {
                    Text("популярные таймлайны")
                        .font(Font.custom("Roboto-ExtraBold", size: 30))
                        .padding(.bottom, 10)
                        .padding(.leading, 20)

                    if viewModel.isLoading {
                        ProgressView("Загрузка...")
                            .padding()
                    } else if let error = viewModel.errorMessage {
                        Text("Ошибка: \(error)")
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        ForEach(viewModel.posts) { post in
                            NavigationLink(destination: DonutView(vm: DonutVM(number: post.id))) {
                                PostView(post: post)
                                    .padding(.bottom, 14)
                            }
                            .buttonStyle(.plain)
                        }
                    }

                }
                VStack(alignment: .leading) {
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
                    
                    Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                        GridRow {
                            AuthorView(author: authors[0])
                            AuthorView(author: authors[1])
                        }
                        GridRow {
                            AuthorView(author: authors[2])
                            AuthorView(author: authors[3])
                        }
                    }
                    .padding(.bottom, 44)
                    
                    Text("популярные теги")
                        .font(Font.custom("Roboto-ExtraBold", size: 30))
                        .padding(.bottom, 10)
                    
                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.thirdcolor, lineWidth: 1.5)
                                .foregroundColor(.white)
                                .frame(width: 120, height: 29)
                                .overlay(
                                    Text("жизнь звезд")
                                        .foregroundStyle(.thirdcolor)
                                        .font(Font.custom("Roboto-Regular", size: 14))
                                )
                            
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.thirdcolor, lineWidth: 1.5)
                                .foregroundColor(.white)
                                .frame(width: 129, height: 29)
                                .overlay(
                                    Text("личная жизнь")
                                        .foregroundStyle(.thirdcolor)
                                        .font(Font.custom("Roboto-Regular", size: 14))
                                )
                            
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.thirdcolor, lineWidth: 1.5)
                                .foregroundColor(.white)
                                .frame(width: 123, height: 29)
                                .overlay(
                                    Text("поп-культура")
                                        .foregroundStyle(.thirdcolor)
                                        .font(Font.custom("Roboto-Regular", size: 14))
                                )
                        }
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.thirdcolor, lineWidth: 1.5)
                                .foregroundColor(.white)
                                .frame(width: 87, height: 29)
                                .overlay(
                                    Text("музыка")
                                        .foregroundStyle(.thirdcolor)
                                        .font(Font.custom("Roboto-Regular", size: 14))
                                )
                            
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.thirdcolor, lineWidth: 1.5)
                                .foregroundColor(.white)
                                .frame(width: 122, height: 29)
                                .overlay(
                                    Text("опыт работы")
                                        .foregroundStyle(.thirdcolor)
                                        .font(Font.custom("Roboto-Regular", size: 14))
                                )
                            
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.thirdcolor, lineWidth: 1.5)
                                .foregroundColor(.white)
                                .frame(width: 162, height: 29)
                                .overlay(
                                    Text("публичные фигуры")
                                        .foregroundStyle(.thirdcolor)
                                        .font(Font.custom("Roboto-Regular", size: 14))
                                )
                        }
                    }
                    .padding(.bottom, 6)
                    
                    HStack {
                        Text("смотреть все")
                            .font(Font.custom("Roboto-Bold", size: 18))
                        Image("arrow")
                            .resizable()
                            .frame(width: 18, height: 10)
                    }
                    .padding(.bottom, 40)
                    
                    TakeEmailView(viewModel: TakeEmailViewModel())
                    BottomTextView()
                }
                .padding(.leading, 2)
            }
            .scrollIndicators(.hidden)
            .padding(.top, 2)
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    ContentView(viewModel: PostViewModel())
}
