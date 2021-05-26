//
//  ImageModelService.swift
//  App
//
//  Created by Ronaldo Gomes on 24/05/21.
//

import Foundation
import Alamofire

class MediaModelService {
    var headers: HTTPHeaders?
    var category: String
    var parameters: [String : String]!
    
    init(category: String) {
        self.category = category
    }
    
    func getMediaResponse<T: ResponseMediaProtocol>(for url: Routes, model: T.Type, mediaType: MediaType, result: @escaping  (Result<ImageAndVideoResponseData,NetworkErrors>) -> ()) {
        setParametersAndHeaders(for: url)
        
        AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: model.self) { response in
            let apiResponse = try! JSONDecoder().decode(model.self, from: response.data!)
            
            switch mediaType {
            case .image:
                guard let unwrappedPhotos = apiResponse.photos?.randomElement(),
                      let unwrappedauthor = unwrappedPhotos.author else {
                    result(.failure(.badData))
                    return
                }
                
                AF.download(unwrappedPhotos.imageSource).responseData {
                    guard let imageData = $0.value else {
                        result(.failure(.badData))
                        return
                    }
                    
                    result(.success(ImageAndVideoResponseData(author: unwrappedauthor, data: imageData)))
                }

            case .video:
                guard let randomResponse = apiResponse.videos?.randomElement(),
                      let unwrappedauthor = randomResponse.author,
                      let unwrappedVideoUrl = randomResponse.videoURL else{
                    result(.failure(.badData))
                    return
                }

                result(.success(ImageAndVideoResponseData(author: unwrappedauthor, data: unwrappedVideoUrl.data(using: .utf8)!)))
            }
        }
    }
    
    func getPictureResponse<T: ResponsePictureProtocol>(for url: Routes, model: T.Type, result: @escaping  (Result<PictureResponseData, NetworkErrors>) -> ()) {
        
        setParametersAndHeaders(for: url)
        
        AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: model.self) { response in
            let apiResponse = try! JSONDecoder().decode(model.self, from: response.data!)
            
            guard let unwrappedPictures = apiResponse.picture?.randomElement(),
                  let unwrappedTitle = unwrappedPictures.title else {
                result(.failure(.badData))
                return
            }
            
            AF.download(unwrappedPictures.pictureUrl).responseData {
                guard let imageData = $0.value else {
                    result(.failure(.badData))
                    return
                }
                
                result(.success(PictureResponseData(title: unwrappedTitle, data: imageData)))
            }
        }
    }
    
    func getPoetryResponse<T: ResponsePoetryProtocol>(for url: Routes, model: T.Type, result: @escaping  (Result<PoetryResponseData, NetworkErrors>) -> ()) {
        
        AF.request(url.rawValue).responseDecodable(of: [T].self) { response in
            let apiResponse = try! JSONDecoder().decode([T].self, from: response.data!)
            
            guard let unwrappedPoetry = apiResponse.randomElement(),
                  let unwrappedAuthor = unwrappedPoetry.author,
                  let unwrappedTitle = unwrappedPoetry.title else {
                result(.failure(.badData))
                return
            }
            
            result(.success(PoetryResponseData(title: unwrappedTitle,
                                               author: unwrappedAuthor,
                                               poetry: (unwrappedPoetry.lines.reduce("", { $0 + "\n" + $1 }).data(using: .utf8)!))))
        }
    }
    
    private func setParametersAndHeaders(for url: Routes) {
        if url == Routes.pexelsImage || url == Routes.pexelsVideo {
            headers = [.authorization(bearerToken: tokens.pexels.rawValue)]
            parameters = ["query": category,
                          "page": "\(Int.random(in: 1..<100))"]
        } else if url == Routes.pixabayImage || url == Routes.pixabayVideo {
            parameters = ["key": tokens.pixabay.rawValue, "category": category]
            headers = []
        } else if url == Routes.rijksmuseum {
            parameters = ["key": tokens.rijksmuseum.rawValue,
                          "technique": "painting",
                          "p": "\(Int.random(in: 1..<1000))"]
        }
    }
}

enum NetworkErrors: Error {
    case wrongURL
    case badData
}

enum MediaType {
    case video
    case image
}
