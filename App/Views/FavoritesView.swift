//
//  FavoritesView.swift
//  App
//
//  Created by Ronaldo Gomes on 27/05/21.
//

import SwiftUI

struct FavoritesView: View {
    private var gridAdaptiveLayout = [GridItem(.adaptive(minimum: 160), spacing: 16)]
    private var viewModel = FavoritesViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridAdaptiveLayout, spacing: 16) {
                ForEach((0..<viewModel.getNumberOfFavorites()), id: \.self) { number in
                    NavigationLink(destination: ContentView()) {
                        MiniMoodboard(imageUrls: viewModel.getMediaOfFavorite(number: number))
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .colorScheme(.dark)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
