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
            CacheAsyncImage(url: URL(string: product.images[0])!) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Image(systemName: "photo.fill")
                            .padding(2)
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(_):
                    Image(systemName: "photo.fill")
                        .padding(2)
                @unknown default:
                    fatalError()
                }
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

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View{
        ProductCard(product: Product(id: 1, name: "Test", description: "Mantap", price: 3400, stock: 20, images: ["https://images.unsplash.com/photo-1585664428450-1665a336eb19?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=256&ixid=MnwxfDB8MXxyYW5kb218MHx8cGxhbnR8fHx8fHwxNjg3NDI0MTk5&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=256"]))
    }
}
