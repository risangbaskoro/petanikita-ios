//
//  ContentView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 21/06/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    
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
                            ProductCard(product: product)
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
