//
//  ApiServices.swift
//  covid
//
//  Created by dani prayogi on 12/03/22.
//

import Foundation
import SwiftUI
import Combine

class ApiServices: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    @Published var dataPenambahan = [Penambahan]() {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var isLoading = true
    
//    @Published var dataPenambahan = [Penambahan]()
    
    init() {
        guard let url = URL(string: "https://data.covid19.go.id/public/api/update.json") else {
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode(DataCovid.self, from: data)
            if let result = result {
                self.isLoading = false
                DispatchQueue.main.async {
                    self.dataPenambahan = [result.update.penambahan]
                    print(result)
                }
            }
        }.resume()
    }
}
