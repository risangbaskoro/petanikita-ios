//
//  ContentView.swift
//  PetaniKita
//
//  Created by Risang Baskoro on 22/06/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            DetectionView()
                .tabItem {
                    Label("Detect", systemImage: "viewfinder")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
