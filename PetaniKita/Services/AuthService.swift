//
//  AuthService.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 23/06/23.
//

import Foundation
import UIKit

enum AuthenticationError: Error {
    case invalidCredentials
    case invalidToken
    case custom(message: String)
}

struct LoginRequestBody: Codable {
    var email: String
    var password: String
    var deviceName: String = UIDevice.current.name
}

struct LoginResponseBody: Codable {
    var token: String?
}

class AuthService: ObservableObject {
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "https://petanikita-capstone-up2i4akwwa-et.a.run.app/api/auth/token") else {
            completion(.failure(.custom(message: "Invalid URL")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = try? jsonEncoder.encode(body)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(message: "No Data")))
                return
            }
            
            guard let responseBody = try? JSONDecoder().decode(LoginResponseBody.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = responseBody.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
        }
        
        task.resume()
    }
    
    func info(token: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "https://petanikita-capstone-up2i4akwwa-et.a.run.app/api/auth/user") else {
            completion(.failure(.custom(message: "Invalid URL")))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.custom(message: "No data")))
                return
            }
            
            guard let responseBody = try? JSONDecoder().decode(UserResponseBody.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            let user = responseBody.data

            completion(.success(user.name))
        }
        
        task.resume()
    }
    
    func logout(token: String) {
        guard let url = URL(string: "https://petanikita-capstone-up2i4akwwa-et.a.run.app/api/auth/logout") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request)
        
        task.resume()
    }
}
