//
//  User.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 22/06/23.
//

import Foundation

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var email: String
    var phone: String
}

struct UserResponseBody: Decodable {
    var data: User
}
