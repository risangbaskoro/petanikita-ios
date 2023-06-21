//
//  Product.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 21/06/23.
//

import Foundation


struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var price: Int
    var stock: Int
    var images: [String] = []
}

struct ProductBody: Decodable {
    var data: [Product] = []
}
