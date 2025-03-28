//
//  AboutAppView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 03.03.2025.
//

import SwiftUI

struct AboutAppView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            
        
        ScrollView {
            
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
                    
                    Text("о приложении")
                        .foregroundStyle(.mainaccent)
                        .font(Font.custom("Roboto-ExtraBold", size: 30))
                        .padding(.leading, 30)
                }
                .padding(.bottom, 28)
                
                
                Image("lapse—")
                    .resizable()
                    .frame(width: 172, height: 46)
                
                Text("это инструмент, который позволяет\nсоздавать детальную визуализацию\nвременнóй шкалы вашей жизни.\nС его помощью пользователи могут\nдобавлять на схемы важные этапы,\nпериоды и события, дополняя их\nописанием и различными цветами\nдля передачи собственного\nвидения истории.")
                    .font(Font.custom("Roboto-Regular", size: 20))
                
                Image("graph")
                    .resizable()
                    .frame(width: 370, height: 312)
                    .padding(.bottom, 40)
                    .padding(.top, 40)
                
                Text("Приложение позволяет с легкостью\nсоздавать, управлять и делиться\nинтерактивными графиками, которые\nнаполнены яркими моментами\nи воспоминаниями из жизни людей\nдля более глубокого понимания\nсобственного пути или пути\nдругого человека.")
                    .font(Font.custom("Roboto-Regular", size: 20))
                
            }
                
                //NavigationLink
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(.mainsecondary)
                .frame(width: 144, height: 34)
                .overlay (
                    Text("создать lapse")
                        .foregroundStyle(.white)
                        .font(Font.custom("Roboto-Black", size: 14)))
                    .padding(.top, 30)
                    
            
            BottomTextView()
               
            
        }
        .scrollIndicators(.hidden)
         
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
            
    }
}

#Preview {
    AboutAppView()
}
