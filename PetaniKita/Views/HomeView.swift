//
//  ContentView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 21/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
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

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 140, maximum: 280), spacing: 20)]
    
    var body: some View {
        NavigationView {
            if viewModel.products.isEmpty {
                ProgressView()
                    .navigationTitle("PetaniKita")
                    .onAppear{
                        viewModel.fetch()
                    }
            }
            else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.products, id: \.self) { product in
                            NavigationLink(destination: {
                                ProductView(product: product)
                            }, label: {
                                ProductCard(product: product)
                            })
                            .foregroundStyle(Color.white)
                        }
                    }
                }
                .padding()
                .navigationTitle("PetaniKita")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
