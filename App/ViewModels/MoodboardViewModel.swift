//
//  MoodboardViewModel.swift
//  App
//
//  Created by Pedro Sousa on 26/05/21.
//

import Foundation
import CoreData

class MoodboardViewModel: ObservableObject {
    private var moodboardRepository: MoodboardRepository
    private var contentsRepository: ContentRepository

    private var moodboard: Moodboard?
    @Published var contentsDataSource: [MoodboardMedia] = []

    private lazy var networkWorker: NetworkWorker = NetworkWorker()

    init() {
        self.moodboardRepository = MoodboardRepository()
        self.contentsRepository = ContentRepository()
    }

    func loadDataSource() {
        if let moodboard = self.moodboardRepository.moodboardOfTheDay(),
           let ids = moodboard.data {
            self.moodboard = moodboard
            self.contentsDataSource = self.contentsRepository.searchBy(ids: ids)
                .compactMap(self.coreDataToMoodboardMedia)
        } else {
            if let newMoodboard = self.moodboardRepository.create(moodboardDay: true) {
                self.moodboard = newMoodboard
                self.networkWorker.delegate = self
                self.networkWorker.request()
            }
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
        if let moodboard = self.moodboard {
            return self.moodboardRepository.favoriteMoodboard(moodboard: moodboard, name: name)
        }
        return false
    }

    func unfavoriteMoodBoard() -> Bool {
        if let moodboard = self.moodboard {
            return self.moodboardRepository.unfavoriteMoodboard(moodboard: moodboard)
        }
        return false
    }

    func refreshMoodBoard() {
        if let moodboard = self.moodboard {
            self.contentsDataSource = []
            if let moodboard = self.moodboardRepository.refreshMoodboard(moodboard: moodboard, newData: []) {
                self.moodboard = moodboard
                self.networkWorker.delegate = self
                self.networkWorker.request()
            }
        }
    }
}

extension MoodboardViewModel: NetworkWorkerDelegate {
    func receivePhoto(result: Result<ImageAndVideoResponseData, NetworkErrors>) {
        switch result {
        case .success(let image):
            if let newContent = self.contentsRepository.create(name: image.author, author: image.author,
                                                               type: 0, data: image.url) {
                self.contentsDataSource.append(.image(title: image.author, url: image.url))
                updateMoodboardData(with: newContent.objectID)
            }
        case .failure(let error):
        print("NetworkError - \(error.localizedDescription)")
        }
    }

    func receiveVideo(result: Result<ImageAndVideoResponseData, NetworkErrors>) {
        switch result {
        case .success(let video):
            if let newContent = self.contentsRepository.create(name: video.author, author: video.author,
                                                               type: 1, data: video.url) {
                self.contentsDataSource.append(.video(title: video.author, url: video.url))
                updateMoodboardData(with: newContent.objectID)
            }
        case .failure(let error):
        print("NetworkError - \(error.localizedDescription)")
        }
    }

    func receivePoetry(result: Result<PoetryResponseData, NetworkErrors>) {
        switch result {
        case .success(let poetry):
            if let newContent = self.contentsRepository.create(name: poetry.titleAndAuthor,
                                                               author: poetry.titleAndAuthor,
                                                               type: 2, data: poetry.poetry) {
                self.contentsDataSource.append(.text(title: poetry.titleAndAuthor, poem: poetry.poetry))
                updateMoodboardData(with: newContent.objectID)
            }
        case .failure(let error):
        print("NetworkError - \(error.localizedDescription)")
        }
    }

    func receivePainting(result: Result<PictureResponseData, NetworkErrors>) {
        switch result {
        case .success(let painting):
            if let newContent = self.contentsRepository.create(name: painting.title, author: "",
                                                               type: 0, data: painting.url) {
                self.contentsDataSource.append(.image(title: painting.title, url: painting.url))
                updateMoodboardData(with: newContent.objectID)
            }
        case .failure(let error):
        print("NetworkError - \(error.localizedDescription)")
        }
    }

    private func updateMoodboardData(with objectID: NSManagedObjectID) {
        if let moodboard = self.moodboard {
            moodboard.data?.append(objectID)
        }
    }
}
