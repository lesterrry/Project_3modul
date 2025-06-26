//
//  SearchView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 21.05.2025.
//

import SwiftUI

struct IdentifiebleString: Identifiable {
    var id: String { value }
    var value: String
}

struct SearchView: View {
    
    @State private var searchText = ""
    let searchResult: [IdentifiebleString] = ["dog", "cat"].map { IdentifiebleString(value: $0) }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("введите текст", text: $searchText)
                    .foregroundColor(Color.red)
                    .font(Font.custom("Robot-Medium", size: 16))
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.black)
            )
            //            .frame(width: 240, height: 14)
            
            
        }
        .padding(.horizontal, 30)
        
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(searchResult) { object in
                        HStack {
                            Text(object.value)
                                .padding(.bottom, 10)
                            
                            Spacer()
                        }
                        
//                        Rectangle()
//                            .foregroundColor(.gray)
//                            .opacity(0.2)
//                            .frame(width: 330, height: 1)
//                            .padding(.bottom, 10)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SearchView()
}
