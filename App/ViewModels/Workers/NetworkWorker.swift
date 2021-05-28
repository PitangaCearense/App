//
//  NetworkWorker.swift
//  App
//
//  Created by José João Silva Nunes Alves on 27/05/21.
//

import Foundation

class NetworkWorker {
    private lazy var services: [MediaModelService] = []
    private var categories: [Categories] = []

    weak var delegate: NetworkWorkerDelegate?

    private let categoryRepository: CategoryRepository = CategoryRepository()

    private func loadCategories() {
        if let data = self.categoryRepository.read(),
           let rawCategories = data.selecteds {
            for rawCategory in rawCategories {
                if let category = Categories(rawValue: rawCategory) {
                    self.categories.append(category)
                }
            }
        }
    }

    func request() {
        self.loadCategories()

        if let category = self.categories.randomElement() {
            if category == .art {
                let service = MediaModelService(category: category.category.name)
                self.createMoodboardOfPaintings(with: service)
            } else {
                let service = MediaModelService(category: category.category.name)
                self.createMoodboardOfImages(with: service)
            }
        }
    }

    private func createMoodboardOfPaintings(with service: MediaModelService) {
        for _ in 0..<30 {
            service.getPictureResponse(for: .rijksmuseum, model: RijksmuseumModel.self,
                                       result: self.sendPainting)
        }
    }

    private func createMoodboardOfImages(with service: MediaModelService) {
        for _ in 0..<30 {
            service.getMediaResponse(for: .pixabayImage, model: PixabayModel.self,
                                     mediaType: .image, result: self.sendPhoto)
//            service.getMediaResponse(for: .pexelsImage, model: PexelsModel.self,
//                                     mediaType: .image, result: self.sendPhoto)
        }
    }

    func sendPhoto(result: Result<ImageAndVideoResponseData, NetworkErrors>) {
        delegate?.receivePhoto(result: result)
    }

    func sendVideo(result: Result<ImageAndVideoResponseData, NetworkErrors>) {
        delegate?.receiveVideo(result: result)
    }

    func sendPoetry(result: Result<PoetryResponseData, NetworkErrors>) {
        self.delegate?.receivePoetry(result: result)
    }

    func sendPainting(result: Result<PictureResponseData, NetworkErrors>) {
        delegate?.receivePainting(result: result)
    }
}
