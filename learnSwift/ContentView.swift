//
//  ContentView.swift
//  learnSwift
//
//  Created by Tommy Yon Prakoso on 05/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var data: CarResponse = []

    func loadData() {
        guard let url = URL(string: "https://rent-car-appx.herokuapp.com/admin/car") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodeResponse = try? JSONDecoder().decode(CarResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.data = decodeResponse
                    }
                    return
                }
            }
            print("Fetch Failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    var body: some View {
        NavigationView {
            List (data, id: \.id) {
                item in
                NavigationLink(destination: DetailFood(name: item.name ?? "", price: item.price ?? 0)) {
                    VStack (alignment: .leading) {
                        Text(item.name ?? "")
                            .bold()
                            .foregroundColor(.blue)
                        Text("\(item.price ?? 0)")
                            .foregroundColor(.green)
                    }
                }
            }.onAppear(perform: loadData).navigationTitle("List of Cars")
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
