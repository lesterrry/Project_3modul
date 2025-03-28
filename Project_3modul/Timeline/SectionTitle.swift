//
//  SectionTitle.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 04.03.2025.
//




import SwiftUI

struct SectionTitle: View {
    var title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .bold()

            Spacer()
        }
    }
}

