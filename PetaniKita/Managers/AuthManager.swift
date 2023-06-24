//
//  AuthViewModel.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 23/06/23.
//

import Foundation

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    
    init() {
        self.check()
    }
    
    func check() {
        if UserDefaults.standard.string(forKey: "token") != nil {
            DispatchQueue.main.async {
                self.isAuthenticated = true
            }
        } else {
            DispatchQueue.main.async {
                self.isAuthenticated = false
            }
        }
    }
    
    func login(email: String, password: String) {
        let defaults = UserDefaults.standard
        
        AuthService().login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "token")
                self.check()
            case .failure(let error):
                dump(error)
            }
        }
    }
    
    func info() {
        let defaults = UserDefaults.standard
        
        let token: String? = defaults.string(forKey: "token")
        
        if token != nil {
            AuthService().info(token: token!) { result in
                switch result {
                case .success(let user):
                    defaults.setValue(user, forKey: "profile")
                    self.check()
                case .failure(let error):
                    dump(error)
                }
            }
        }
    }
    
    func logout() {
        let defaults = UserDefaults.standard
        
        let token: String? = defaults.string(forKey: "token")
        
        AuthService().logout(token: token!)

        defaults.removeObject(forKey: "token")
        defaults.removeObject(forKey: "profile")
        self.check()
    }
}
