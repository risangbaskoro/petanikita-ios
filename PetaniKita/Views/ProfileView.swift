//
//  ProfileView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 22/06/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var auth = AuthManager()
    
    var body: some View {
        if auth.isAuthenticated {
            NavigationView {
                VStack {
                    VStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .padding()
                            .background(.gray)
                            .clipShape(Circle())
                        
                        Text("John Doe")
                            .font(.title)
                        Text("johndoe@email.com")
                        Text("081282828282")
                    }
                    
                    Spacer()
                        .navigationTitle("Profile")
                    
                    Button{
                        auth.logout()
                    } label: {
                        Text("Logout")
                            .frame(maxWidth: .infinity, maxHeight: 35)
                            .font(.headline)
                    }
                    .buttonStyle(.bordered)
                    .tint(Color.red)
                    .padding(.bottom)
                }
                .onAppear {
                    auth.info()
                }
            }
        } else {
            LoginView(auth: auth)
        }
    }
}

struct ProileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
