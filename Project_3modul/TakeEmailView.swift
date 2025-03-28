//
//  TakeEmailView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 04.03.2025.
//

import SwiftUI

struct TakeEmailView: View {
    
    @State private var takemail: String = ""
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(.mainaccent)
                .frame(width: 390, height: 168)
            
            VStack (alignment: .leading) {
                Text("не теряйте связь")
                    .foregroundStyle(.white)
                    .font(Font.custom("Roboto-ExtraBold", size: 26))
                    .padding(.top, 8)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.mainsecondary, lineWidth: 1.5)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.white)
                        )
                        .frame(width: 346, height: 37)
                    
                    TextField("email", text: $takemail)
                        .foregroundColor(.mainsecondary)
                        .font(Font.custom("Roboto-Medium", size: 14))
                        .padding(.horizontal, 10)
                        .frame(width: 320, height: 45)
                }
                .padding(.bottom, 2)
                
                ZStack {//
                    Button(action: {
                        print("button tapped")
                    }) {
                        Text("подписаться")
                            .foregroundColor(.white) //текст
                            .font(Font.custom("Roboto-Medium", size: 14))
                            .frame(width: 120, height: 28)
                            .background(Color.mainaccent) // фон
                            .cornerRadius(14) // Закругленные углы
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.white, lineWidth: 1.5) // Белая обводка
                            )
                    }
                }
                .padding(.top, 2)
                .padding(.bottom, 6)
                
            }
        }
        
        
        
        
        
        
        
        
        
    }
}

#Preview {
    TakeEmailView()
}
