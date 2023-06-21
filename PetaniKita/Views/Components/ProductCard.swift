//
//  ProductCard.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 21/06/23.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        HStack {
            URLImage(string: !product.images.isEmpty ? product.images[0] : "photo.fill")
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text("\(product.stock) in stock")
                    .font(.footnote)
            }
            .padding(.trailing)
            
            Spacer()
            
            Text("Rp\(product.price)/kg")
                .font(.subheadline)
        }
        .padding()
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View{
        ProductCard(product: Product(id: 1, name: "Test", description: "Mantap", price: 3400, stock: 20, images: []))
    }
}
