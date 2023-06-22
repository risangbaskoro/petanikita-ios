//
//  LoginView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 23/06/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var auth = AuthManager()
    
    var body: some View {
        VStack {
            TextField("Email", text: $auth.email)
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Password", text: $auth.password)
                .textFieldStyle(DefaultTextFieldStyle())
            Button("Login") {
                auth.login()
            }
            .buttonStyle(DefaultButtonStyle())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
