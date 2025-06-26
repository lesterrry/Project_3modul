import SwiftUI

final class DonutVM: ObservableObject {
    @Published var colors: [Color] = []
    @Published var donutData: DonutModel? {
        willSet {
            var colorSet = Set<Color>()
            while colorSet.count < newValue?.periods.count ?? 0 {
                colorSet.insert(generateRandomColor())
            }
            colors = Array(colorSet)
        }
    }
    private var worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")
    
    let number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    func loadDonut() {
        guard let token = KeychainService().getString(forKey: "token") else {
            return
        }
        
        let endp = DonutEndpoint.donut(number: number, token: token)
        let req = Request(endpoint: endp)
        
        worker.executeRequest(with: req) { result in
            switch result {
            case .success(let resp):
                if let data = resp.data {
                    do {
                        let decodedData = try JSONDecoder().decode(DonutModel.self, from: data)
                        DispatchQueue.main.async {
                            self.donutData = decodedData
                        }
                    } catch {
                        print("Decoding error: \(error)")
                    }
                }
            case .failure(let error):
                print("Request error: \(error)")
            }
        }
    }
    
    func loadTimelines() {
        guard let token = KeychainService().getString(forKey: "token") else {
            return
        }
        
        let endp = TimelineEndpoint.timelines(token: token)
        let req = Request(endpoint: endp)
        
        worker.executeRequest(with: req) { result in
            switch result {
            case .success(let resp):
                if let data = resp.data {
                    do {
                        let decodedData = try JSONDecoder().decode([DonutModel].self, from: data)
                        DispatchQueue.main.async {
                            print(decodedData)
                        }
                    } catch {
                        print("Decoding error: \(error)")
                    }
                }
            case .failure(let error):
                print("Request error: \(error)")
            }
        }
    }
    
    private func generateRandomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}

#Preview {
    DonutView(vm: DonutVM(number: 2))
}
