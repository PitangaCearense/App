//
//  NetworkWorker.swift
//  App
//
//  Created by Pedro Sousa on 26/05/21.
//

import Foundation

class NetworkWorker {
    private lazy var services: [MediaModelService] = []
    private let preferences: [Categories]

    private lazy var photoResponse: [ImageAndVideoResponseData] = []
    private lazy var videoResponse: [ImageAndVideoResponseData] = []
    private lazy var paintingResponse: [PictureResponseData] = []
    private lazy var poetryResponse: [PoetryResponseData] = []

    init() {
        self.preferences = Categories.allCases
        self.createServices()
    }

    private func createServices() {
        for preference in preferences {
            services.append(MediaModelService(category: preference.category.name))
        }
    }

    func request() {
        for service in services {
            service.getMediaResponse(for: .pexelsImage, model: PexelsModel.self,
                                     mediaType: .image, result: self.receivePhoto)
            service.getMediaResponse(for: .pixabayImage, model: PixabayModel.self,
                                     mediaType: .image, result: self.receivePhoto)

            service.getMediaResponse(for: .pexelsVideo, model: PexelsModel.self,
                                     mediaType: .video, result: self.receiveVideo)
            service.getMediaResponse(for: .pixabayVideo, model: PixabayModel.self,
                                     mediaType: .video, result: self.receiveVideo)
        }
    }
}

extension NetworkWorker: MediaModelServiceDelegate {
    func receivePhoto(result: Result<ImageAndVideoResponseData, NetworkErrors>) {
        switch result {
        case .success(let data):
            self.photoResponse.append(data)
        default:
            return
        }
    }

    func receiveVideo(result: Result<ImageAndVideoResponseData, NetworkErrors>) {
        switch result {
        case .success(let data):
            self.videoResponse.append(data)
        default:
            return
        }
    }

    func receivePoetry(result: Result<PoetryResponseData, NetworkErrors>) {
        switch result {
        case .success(let data):
            self.poetryResponse.append(data)
        default:
            return
        }
    }

    func receivePainting(result: Result<PictureResponseData, NetworkErrors>) {
        switch result {
        case .success(let data):
            self.paintingResponse.append(data)
        default:
            return
        }
    }
    
    
}



protocol MediaModelServiceDelegate {
    func receivePhoto(result: Result<ImageAndVideoResponseData, NetworkErrors>)
    func receiveVideo(result: Result<ImageAndVideoResponseData, NetworkErrors>)
    func receivePoetry(result: Result<PoetryResponseData, NetworkErrors>)
    func receivePainting(result: Result<PictureResponseData, NetworkErrors>)
}
