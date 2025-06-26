//
//  DonutView.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 21.05.2025.
//

import Charts
import SwiftUI

struct DonutView: View {
    @ObservedObject var vm: DonutVM
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
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
                
                Text(vm.donutData?.title ?? "Loading...")
                    .foregroundStyle(.mainaccent)
                    .font(Font.custom("Roboto-ExtraBold", size: 30))
                    .padding(.leading, 18)
                    .frame(width: 200)
            }
            .padding(.trailing, 14)
            .padding(.bottom, 35)
            
            VStack {
                if let donutData = vm.donutData {
                    Chart {
                        ForEach(Array(donutData.periods.enumerated()), id: \.offset) { index, period in
                            SectorMark(
                                angle: .value(period.title, period.duration),
                                innerRadius: .ratio(0.6),
                                angularInset: 2.0
                            )
                            .foregroundStyle(Color(hex: period.colorHex) ?? vm.colors[index])
                            .annotation(position: .overlay) {
                                Text(period.title)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .padding(.horizontal, 30)
            .frame(height: 500)
            //        .chartLegend(.hidden)
            .task {
                vm.loadDonut()
            }
            
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        
        .padding(.bottom, 245)
    }
}

#Preview {
    @Previewable @Environment(\.dismiss) var dismiss
    DonutView(vm: DonutVM(number: 1), dismiss: _dismiss)
}
