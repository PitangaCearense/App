//
//  RootViewViewModel.swift
//  App
//
//  Created by Pedro Sousa on 28/05/21.
//

import Foundation

class RootViewViewModel {
    private let moodBoardRepository: MoodboardRepository = MoodboardRepository()

    func favoriteList() -> [String] {
        if let favorites = self.moodBoardRepository.getAllFavorites() {
            return favorites.compactMap { moodboard in
                moodboard.name
            }
        }
        return []
    }
}
