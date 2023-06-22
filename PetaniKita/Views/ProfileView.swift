//
//  ProfileView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 22/06/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if viewModel.user != nil {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .padding()
                            .background(.gray)
                            .clipShape(Circle())

                        Text(viewModel.user.name)
                            .font(.title)
                        Text(viewModel.user.email)
                        Text(viewModel.user.phone)
                    } else {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
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
