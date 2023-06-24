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
        ZStack(alignment: .bottom) {
            if !product.images.isEmpty {
                CacheAsyncImage(url: URL(string: product.images[0])!) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            ProductCardImagePlaceholder()
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                    case .success(let image):
                        image
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .scaledToFit()
                    case .failure(_):
                        ProductCardImagePlaceholder()
                    @unknown default:
                        fatalError()
                    }
                }
            } else {
                ProductCardImagePlaceholder()
            }
            
            HStack(alignment: .center) {
                Text(product.name)
                    .lineLimit(1)
                    .font(.system(size: 12))
                    .bold()
                
                Spacer()
                
                Text("Rp\(product.price)")
                    .font(.system(size: 8))
            }
            .padding()
            .background(.ultraThinMaterial)
        }
        .frame(minWidth: 80, minHeight: 80)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
    }
}

struct ProductCardImagePlaceholder: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .scaledToFit()
            .padding(.bottom, 60)
            .padding(.horizontal)
            .foregroundStyle(Color.gray)
            .frame(maxWidth: 200, maxHeight: 350)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View{
        ProductCard(product: Product(id: 1, name: "Test", description: "Mantap", price: 3400, stock: 20, images: []))
    }
}
