//
//  Project_3modulApp.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 03.03.2025.
//

import SwiftUI

@main
struct Project_3modulApp: App {
    var body: some Scene {
        WindowGroup {
            LogInView(viewModel: ViewModel())
//            DonutView(vm: DonutVM())
           // TestDonutCharts()
        
            //LogInView(viewModel: ViewModel()) //ContentView()
        }
    }
}
