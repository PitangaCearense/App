//
//  NetworkWorker.swift
//  App
//
//  Created by Pedro Sousa on 26/05/21.
//

import Foundation

class NetworkWorker {
    private lazy var services: [MediaModelService] = []
    private var categories: [Categories] = []

    weak var delegate: NetworkWorkerDelegate?

    private let categoryRepository: CategoryRepository = CategoryRepository()

    init() {
        self.loadCategories()
        self.createServices()
    }

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

    private func createServices() {
        for category in self.categories {
            services.append(MediaModelService(category: category.category.name))
        }
    }

    func request() {
        for service in services {
//            service.getMediaResponse(for: .pexelsImage, model: PexelsModel.self,
//                                     mediaType: .image, result: self.sendPhoto)
            service.getMediaResponse(for: .pixabayImage, model: PixabayModel.self,
                                     mediaType: .image, result: self.sendPhoto)

//            service.getMediaResponse(for: .pexelsVideo, model: PexelsModel.self,
//                                     mediaType: .video, result: self.sendVieo)
//            service.getMediaResponse(for: .pixabayVideo, model: PixabayModel.self,
//                                     mediaType: .video, result: self.receiveVideo)
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
