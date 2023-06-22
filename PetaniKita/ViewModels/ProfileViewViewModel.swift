//
//  ProfileViewViewModel.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 22/06/23.
//

import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var user: User!
    
    func fetch() {
        guard let url = URL(string: "https://petanikita-capstone-up2i4akwwa-et.a.run.app/api/auth/user") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer 9|wvHNUnQkk6ocJgzHngzMKffw0Dk7R6Y7bdGdpe9v", forHTTPHeaderField: "Authorization") // TODO: Edit this
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let jsonBody = try JSONDecoder().decode(UserBody.self, from: data)
                let user = jsonBody.data
                
                DispatchQueue.main.async {
                    self?.user = user
                }
                dump(user)
            } catch {
                dump(error)
            }
        }
        task.resume()
    }
}
