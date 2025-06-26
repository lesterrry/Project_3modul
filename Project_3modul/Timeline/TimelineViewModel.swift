//
//  TimelineViewModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 20.05.2025.
//


// перенести в отдельный файлик
//struct Period: Codable {
//    let id, lifetimeID: Int
//    let start, end, title, description: String
//    let colorHex: String?
//    let createdAt, updatedAt: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case lifetimeID = "lifetime_id"
//        case start, end, title, description
//        case colorHex = "color_hex"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//    }
//    
//    var duration: TimeInterval {
//        let formatter = ISO8601DateFormatter()
//        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
//        
//        var startDate = formatter.date(from: start) ?? Date()
//        var endDate = formatter.date(from: end) ?? Date()
//        
//        return startDate.timeIntervalSince(endDate)
//    }
//}
//
//import Charts
//import SwiftUI
//
//enum DonutEndpoint: Endpoint {
//    case donut(number: Int, token: String)
//    
//    var compositePath: String {
//        switch self {
//        case .donut(let number, _):
//            return "/api/lifetimes/\(number)"
//        }
//    }
//    
//    var headers: [String : String] {
//        switch self {
//        case .donut(_, let token):
//            return ["Authorization": "Bearer \(token)"]
//        }
//    }
//}
//
//final class DonutVM: ObservableObject {
//    @Published var colors: [Color] = []
//    @Published var donutData: DonutModel? {
//        willSet {
//            var colorSet = Set<Color>()
//            while colorSet.count < newValue?.periods.count ?? 0 {
//                colorSet.insert(generateRandomColor())
//            }
//            colors = Array(colorSet)
//        }
//    }
//    private var worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")
//    
//    func loadDonut(number: Int = 2) {
//        guard let token = KeychainService().getString(forKey: "token") else {
//            return
//        }
//        
//        let endp = DonutEndpoint.donut(number: number, token: token)
//        let req = Request(endpoint: endp)
//        
//        worker.executeRequest(with: req) { result in
//            switch result {
//            case .success(let resp):
//                if let data = resp.data {
//                    do {
//                        let decodedData = try JSONDecoder().decode(DonutModel.self, from: data)
//                        DispatchQueue.main.async {
//                            self.donutData = decodedData
//                        }
//                    } catch {
//                        print("Decoding error: \(error)")
//                    }
//                }
//            case .failure(let error):
//                print("Request error: \(error)")
//            }
//        }
//    }
//    
//    private func generateRandomColor() -> Color {
//        let red = Double.random(in: 0...1)
//        let green = Double.random(in: 0...1)
//        let blue = Double.random(in: 0...1)
//        return Color(red: red, green: green, blue: blue)
//    }
//}
//
//struct DonutView: View {
//    @ObservedObject var vm: DonutVM
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        
//        NavigationStack {
//            
//            HStack {
//                
//                Button(action: {
//                    dismiss()
//                }) {
//                    Image(systemName: "multiply")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.mainaccent)
//                        .padding()
//                }
//                
//                Text("эры тейлор свифт")
//                    .foregroundStyle(.mainaccent)
//                    .font(Font.custom("Roboto-ExtraBold", size: 30))
//                    .padding(.leading, 18)
//            }
//            .padding(.trailing, 14)
//            .padding(.bottom, 35)
//            
//            VStack {
//                if let donutData = vm.donutData {
//                    Chart {
//                        ForEach(Array(donutData.periods.enumerated()), id: \.offset) { index, period in
//                            SectorMark(
//                                angle: .value(period.title, period.duration),
//                                innerRadius: .ratio(0.6),
//                                angularInset: 2.0
//                            )
//                            .foregroundStyle(Color(hex: period.colorHex) ?? vm.colors[index])
//                            .annotation(position: .overlay) {
//                                Text(period.title)
//                                    .font(.headline)
//                                    .foregroundStyle(.white)
//                            }
//                        }
//                    }
//                } else {
//                    ProgressView()
//                }
//            }
//            .padding(.horizontal, 30)
//            .frame(height: 500)
//            //        .chartLegend(.hidden)
//            .task {
//                vm.loadDonut()
//            }
//            
//        }
//        .navigationBarTitle("")
//        .navigationBarBackButtonHidden(true)
//        
//        .padding(.bottom, 245)
//        
//    }
//}
//
//#Preview {
//    
//    DonutView(vm: DonutVM())
//}
