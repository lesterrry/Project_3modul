//
//  TestLogIn.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 04.03.2025.
//

import SwiftUI

struct LogInView: View {
    @ObservedObject var viewModel: ViewModel
    @State var email: String = "be@bra.com"
    @State var password: String = "1234"
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if viewModel.gotToken {
                    // TODO: - перейти на главный экран???
                    ContentView(viewModel: PostViewModel())
                    
//                    Label("Label", systemImage: "42.circle")
//                    Button("Get all users") {
//                        viewModel.getUsers()
                
                } else {
                    VStack {
                        Image("logolight")
                            .resizable()
                            .frame(width: 109, height: 46)
                            .padding(.bottom, 68)
                        Text("войти в аккаунт")
                            .foregroundColor(.mainaccent)
                            .font(Font.custom("Roboto-ExtraBold", size: 30))
                            .padding(.bottom, 12)
                        
                        VStack {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1.5)
                                .background(Color.white)
                                .frame(width: 362, height: 45)
                                .overlay (
                                    TextField("email", text: $email)
                                        .background(Color.white)
                                        .foregroundColor(.mainsecondary)
                                        .frame(width: 320, height: 45)
                                        .font(Font.custom("Roboto-Medium", size: 16)))
                                .padding(.bottom, 8)
                            
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.mainaccent, lineWidth: 1.5)
                                .background(Color.white)
                                .frame(width: 362, height: 45)
                                .overlay (
                                    SecureField("пароль", text: $password)
                                        .background(Color.white)
                                        .foregroundColor(.mainsecondary)
                                        .frame(width: 320, height: 45)
                                        .font(Font.custom("Robot-Medium", size: 16)))
                                .padding(.bottom, 20)
                            
                         
                            Button(action: {
                                viewModel.signIn(
                                    login: email,
                                    password: password
                                )
                            }) {
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundStyle(.mainaccent)
                                    .frame(width: 362, height: 45)
                                    .overlay(
                                        Text("войти")
                                            .foregroundColor(.white)
                                            .font(Font.custom("Roboto-Medium", size: 18)))
                            }
                            .padding(.bottom, 4)
                             
                            NavigationLink(destination: RegistrationTest(viewModel: SignupViewModel())) {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.secondarygray)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color.mainaccent, lineWidth: 1.5)
                                    ) 
                                    .frame(width: 362, height: 45)
                                    .overlay(
                                        Text("зарегистрироваться")
                                            .foregroundStyle(.mainaccent)
                                            .font(Font.custom("Roboto-Medium", size: 18)))
                            }
                            .navigationBarTitle("")
                            .navigationBarBackButtonHidden(true)
                            
                        }
                    }.padding(.top, 154)
                    
//                                        Button("войти") {
//                                            viewModel.signIn(
//                                                login: "be@bra.com",
//                                                password: "1234"
//                                            ) }
                    // yanaglukhova@gmail.com
                    
                    Spacer()
                    BottomTextView()
                    
                }
                
            }
        }
        
    }
}
#Preview {
    LogInView(viewModel: ViewModel())
}

