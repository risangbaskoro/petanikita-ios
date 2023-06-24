//
//  ProductView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 24/06/23.
//

import SwiftUI

struct ProductView: View {
    var product: Product
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(product.images, id: \.self) { imageUrl in
                        CacheAsyncImage(url: URL(string: imageUrl)!) { phase in
                            switch phase {
                            case .empty:
                                VStack {
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity)
                                        .scaledToFit()
                                        .foregroundStyle(Color.gray)
                                        .padding(.bottom)
                                    ProgressView()
                                }
                                .padding()
                            case .success(let image):
                                image
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .scaledToFit()
                                    .padding(.bottom)
                            case .failure(_):
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .scaledToFit()
                                    .padding(.bottom)
                            @unknown default:
                                fatalError()
                            }
                        }
                    }
                }
            }
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.title2)
                    .bold()
                
                HStack (alignment: .center) {
                    Text("Rp\(product.price)/kg")
                        .bold()
                    Spacer()
                    Text("Stock: \(product.stock) kg")
                        .font(.footnote)
                }
                .padding(.vertical)
                ScrollView(.vertical, showsIndicators: false) {
                    Text(product.description)
                }
            }
            .frame(maxWidth: .infinity)
            
            
            Spacer()
            
            Button {
                print("Implement add to cart") // TODO: Implement add to cart
            } label: {
                Text("Add to cart")
                    .frame(maxWidth: .infinity, maxHeight: 35)
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: 1, name: "Nama Produk Yang Panjang Banget Sekalian", description: "Lorem ipsum dolor sit amet, mantap mantap mantap. \nOke Oke Oke Oke oke oke oke oke\nKadaing kita emang harus begini\nI'm neglecting my realm to dissent your repeating line\nBut according to you all these letters were written out right\nConfusing it seems but subconsiusly re-reading the poem that you've sent to me it blows straigth understanding of what may and may nnot rhyme", price: 3400, stock: 20, images: [
            "https://storage.googleapis.com/petanikita-media/13/256x256.jpeg",
            "https://storage.googleapis.com/petanikita-media/1/256x256.jpeg",
            "https://storage.googleapis.com/petanikita-media/4/256x256.jpeg"
        ]))
    }
}
