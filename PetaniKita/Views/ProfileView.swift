//
//  ProfileView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 22/06/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
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
                    
                    Text("John")
                        .font(.title)
                    Text("Email")
                    Text("Phone")
                }
                
                Spacer()
                    .navigationTitle("Profile")
                    .onAppear {
                        viewModel.fetch()
                    }
            }
        }
    }
}

struct ProileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
