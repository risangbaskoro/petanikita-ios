//
//  LoginView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 23/06/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var auth = AuthManager()
    @State var showRegisterSheet = false
    
    var body: some View {
        VStack {
            VStack {
                Image("logo.watermark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .padding()
                
                TextField("Email", text: $auth.email)
                    .padding()
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password", text: $auth.password)
                    .padding()
                    .textFieldStyle(DefaultTextFieldStyle())
                
                Button{
                    auth.login()
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            HStack {
                Text("Don't have one?")
                Button("Create an account") {
                    
                }
                .padding(.vertical)
                .sheet(isPresented: $showRegisterSheet) {
                    DetectionView()
                }
            }
            .font(.footnote)
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
