//
//  URLImage.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 21/06/23.
//

import SwiftUI

struct URLImage: View {
    let string: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .background(.gray)
        }
        else {
            Image(systemName: "photo.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .background(.gray)
                .onAppear {
                    self.fetch()
                }
        }
    }
    
    private func fetch() {
        guard let url = URL(string: string) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            self.data = data
        }
        
        task.resume()
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(string: "https://images.unsplash.com/photo-1517021818302-9b520a06c834?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=256&ixid=MnwxfDB8MXxyYW5kb218MHx8cGxhbnR8fHx8fHwxNjg3MzQ0Nzk5&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=256")
    }
}
