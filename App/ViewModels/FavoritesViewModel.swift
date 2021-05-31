//
//  FavoritesViewModel.swift
//  App
//
//  Created by Ronaldo Gomes on 28/05/21.
//

import Foundation

class FavoritesViewModel {
    private let moodBoardRepository: MoodboardRepository = MoodboardRepository()
    private let contentRepository: ContentRepository = ContentRepository()
    private let allFavorites: [Moodboard]?

    init() {
        allFavorites = moodBoardRepository.getAllFavorites()
    }

    func getNumberOfFavorites() -> Int {
        guard let allFavorites = allFavorites else {
            return 0
        }

        return allFavorites.count
    }

    func getMediaOfFavorite(number: Int) -> [String] {
        guard let allFavorites = allFavorites else {
            return []
        }

        let favorite = allFavorites[number]
        let contents = contentRepository.searchBy(ids: favorite.data ?? [])
        let imagesDatas = contents.filter { content in
            content.type == 0
        }
        let imageUrl = imagesDatas.compactMap { content in
            content.data
        }
        var url: [String] = [String]()
        url.append(favorite.name ?? "")
            
        for index in 0...3 {
            url.append(imageUrl[index])
        }

        return url
    }
}
