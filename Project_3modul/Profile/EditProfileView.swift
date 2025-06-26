//
//  EditProfileView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 19.05.2025.
//

import SwiftUI

struct EditProfileView: View {
    
    @Binding var user: UserProfile
    @Binding var selectedImage: UIImage?
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var description: String = ""
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Фото профиля")) {
                    Button(action: {
                        showImagePicker.toggle()
                    }) {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                
                        } else {
                            Image("profileimage")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                        }
                    }
                }
                
                Section(header: Text("Личные данные")) {
                    TextField("Имя", text: $firstName)
                    TextField("Фамилия", text: $lastName)
                    TextField("Email", text: $description)
                    
                }
            }
            .navigationBarTitle("Редактирование")
            .padding(.bottom, 24)
            .navigationBarItems(leading: Button("Отменить") {
              UIApplication.shared.windows.first?.rootViewController?.dismiss(
                        animated: true,
                        completion: nil
                    )
            }
            .font(Font.custom("SuisseIntl-Regular", size: 18))
            .foregroundStyle(.orange)
                                
                , trailing: Button("Сохранить") {
                user.firstName = firstName
                user.lastName = lastName
                user.description = description
//                if let selectedImage = selectedImage {
//                    user.avatar = selectedImage
//                }
                let data = try? JSONEncoder().encode(user)
                UserDefaults.standard.set(data, forKey: "userdata")
                
                UIApplication.shared.windows.first?.rootViewController?.dismiss(
                          animated: true,
                          completion: nil
                      )
            }
            .font(Font.custom("SuisseIntl-Regular", size: 18))
            .foregroundStyle(.orange)
            )
            .onAppear {
                firstName = user.firstName
                lastName = user.lastName
                description = user.description
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
        
        
        
        
        
    }
}

//#Preview {
//    EditProfileView(viewModel: UserProfile())
//}


