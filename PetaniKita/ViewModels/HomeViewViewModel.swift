//
//  HomeViewViewModel.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 21/06/23.
//

import Foundation

class HomeViewViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetch() {
        guard let url = URL(string: "https://petanikita-capstone-up2i4akwwa-et.a.run.app/api/products") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let jsonBody = try JSONDecoder().decode(ProductBody.self, from: data)
                let products = jsonBody.data
                
                DispatchQueue.main.async {
                    self?.products = products
                }
            } catch {
                dump(error)
            }
        }
        task.resume()
    }
}
