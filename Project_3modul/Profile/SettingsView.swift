//
//  SettingsView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 05.03.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showLogoutAlert = false
    @State private var shouldNavigateToLogin = false  // Флаг для навигации
    @Environment(\.dismiss) var dismiss
    
    init(showFeedback: Bool = false, showLogoutAlert: Bool = false) {
        self.showLogoutAlert = showLogoutAlert
    }
    
    var body: some View {
        
        //
        
            
        NavigationStack {
            
            VStack (alignment: .leading) {
            
                HStack {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.mainaccent)
                            .padding()
                    }
                    
                    Text("настройки")
                        .foregroundStyle(.mainaccent)
                        .font(Font.custom("Roboto-ExtraBold", size: 30))
                        .padding(.leading, 42)
                    
                    Spacer()
                }
            }
            .padding(.leading, 42)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            
            
            VStack (alignment: .leading) {
                
            Text("другое")
                .font(Font.custom("Roboto-ExtraBold", size: 28))
                .padding(.bottom, 8)
                .padding(.top, 6)
            
                
                Button(action: {
                    let email = "lapse@yandex.ru"
                    let subject = "Техническая поддержка"
                    let body = "Опишите вашу проблему:"
                    
                    if let url = URL(string: "mailto:\(email)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        } else {
                            print("Не удалось открыть почтовый клиент")

                        }
                    }
                }) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.mainsecondary, lineWidth: 1.5)
                        )
                        .frame(width: 380, height: 45)
                        .overlay(
                            Text("техническая поддержка")
                                .font(Font.custom("Roboto-Medium", size: 20))
                                .foregroundColor(.mainaccent)
                                .padding(.trailing, 104)
                        )
                }
               
                
                Section {
                    Button(action: {
                        showLogoutAlert.toggle()
                        
                    }) { RoundedRectangle(cornerRadius: 15)
                            .fill(Color.secondred)
                            .stroke(Color.red, lineWidth: 1.5)
                            .frame(width: 380, height: 45)
                            .overlay (
                                Text("выйти из аккаунта").font(Font.custom("Roboto-Medium", size: 20))
                                    .foregroundColor(.red)
                                    .padding(.trailing, 158))
                    }
                    .alert(isPresented: $showLogoutAlert) {
                        Alert(
                            title: Text("Выход из аккаунта"),
                            message: Text("Вы уверены, что хотите выйти из своего аккаунта?"),
                            primaryButton: .destructive(Text("Выйти")) {
                                //                      logout()
                                print("User logged out")
                                KeychainService().clearKeychain()
                                //                        LogInView(viewModel: ViewModel())
                                shouldNavigateToLogin = true
                            },
                            secondaryButton: .cancel(Text("Отменить"))
                        )
                    }
                    .background(
                        NavigationLink(
                            destination: LogInView(viewModel: ViewModel()),
                            isActive: $shouldNavigateToLogin,
                            label: { EmptyView() }
                        )
                    )
                }
                .padding(.top, 8)
                
            }
           
            
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
