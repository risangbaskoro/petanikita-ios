//
//  ContentView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 21/06/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        NavigationView {
            // TODO: Change to LazyVGrid
            List {
                ForEach(viewModel.products, id: \.self) { product in
                    ProductCard(product: product)
                }
            }
            .navigationTitle("PetaniKita")
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
