//
//  AuthViewModel.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 23/06/23.
//

import Foundation

class AuthManager: ObservableObject {
    var email: String = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    init() {
        self.check()
    }
    
    func check() {
        let defaults = UserDefaults.standard
        if defaults.string(forKey: "token") == nil {
            DispatchQueue.main.async {
                self.isAuthenticated = true
            }
        }
    }
    
    func login() {
        let defaults = UserDefaults.standard
        
        AuthService().login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "token")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
                print(token)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}