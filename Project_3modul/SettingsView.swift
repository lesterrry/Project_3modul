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
    
    init(showFeedback: Bool = false, showLogoutAlert: Bool = false) {
        self.showLogoutAlert = showLogoutAlert
    }
    
    var body: some View {
        
        Section {
            Button(action: {
                showLogoutAlert.toggle()
                
            }) {
                Text("Выйти из аккаунта").font(Font.custom("Roboto-Medium", size: 20))
                    .foregroundColor(.red)
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
                    secondaryButton: .cancel(Text("Отмена"))
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
        
    }
}

#Preview {
    SettingsView()
}
