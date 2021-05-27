//
//  MoodboardViewModel.swift
//  App
//
//  Created by Pedro Sousa on 26/05/21.
//

import Foundation

class MoodboardViewModel: ObservableObject {
    private var moodboardRepository: MoodboardRepository
    private var contentsRepository: ContentRepository

    private var moodboard: Moodboard?
    @Published var contentsDataSource: [MoodboardMedia] = []

    private lazy var networkWorker: NetworkWorker = NetworkWorker()

    init() {
        self.moodboardRepository = MoodboardRepository()
        self.contentsRepository = ContentRepository()

        self.moodboard = self.moodboardRepository.moodboardOfTheDay()

        self.loadDataSource()
    }

    private func loadDataSource() {
        if let moodboard = self.moodboard,
           let ids = moodboard.data {
            self.contentsDataSource = self.contentsRepository.searchBy(ids: ids)
                .compactMap(self.coreDataToMoodboardMedia)
        } else {
//            self.networkWorker.request()
            print("Empty")
        }
    }

    private func coreDataToMoodboardMedia(content: Content) -> MoodboardMedia? {
        let type = Int(content.type)
        switch type {
        case 0:
            return .image(title: content.name ?? "Unknown", url: content.data ?? "")
        case 1:
            return .video(title: content.name ?? "Unknown", url: content.data ?? "")
        case 2:
            return .text(title: content.name ?? "Unknown", poem: content.data ?? "")
        default:
            return nil
        }
    }

    func favoriteMoodboard(with name: String) -> Bool {
        if let moodboard = moodboard {
            self.moodboardRepository.favoriteMoodboard(moodboard: moodboard, name: name)
            return true
        }
        return false
    }

    func unfavoriteMoodBoard() -> Bool {
        if let moodboard = moodboard {
            self.moodboardRepository.unfavoriteMoodboard(moodboard: moodboard)
            return true
        }
        return false
    }

//    func refreshMoodBoard() -> Bool {
//        self.networkWorker.request()
//    }
}
