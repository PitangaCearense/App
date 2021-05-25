//
//  ImageModelService.swift
//  App
//
//  Created by Ronaldo Gomes on 24/05/21.
//

import Foundation
import Alamofire

class ImageAndVideoModelService: ModelServices {
    var headers: HTTPHeaders!
    var category: String
    var parameters: [String : String]!
    
    init(category: String) {
        self.category = category
    }
    
    func getMediaResponse<T: ResponseMediaProtocol>(for url: ApiUrl, model: T.Type, mediaType: MediaType, result: @escaping  (Result<ImageAndVideoResponseData,NetworkErrors>) -> ()) {
        setParametersAndHeaders(for: url)
        
        AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: model.self) { response in
            let apiResponse = try! JSONDecoder().decode(model.self, from: response.data!)
            
            var mediaURL: String, author: String
            
            switch mediaType {
            case .image:
                guard let randomResponse = apiResponse.photos?.randomElement(),
                      let unwrappedauthor = randomResponse.author else {
                    result(.failure(.badData))
                    return
                }
                mediaURL = randomResponse.imageSource
                author = unwrappedauthor
            case .video:
                guard let randomResponse = apiResponse.videos?.randomElement(),
                      let unwrappedauthor = randomResponse.author,
                      let unwrappedVideoUrl = randomResponse.videoURL else{
                    result(.failure(.badData))
                    return
                }
                mediaURL = unwrappedVideoUrl
                author = unwrappedauthor
            }
            
            result(.success(ImageAndVideoResponseData(author: author, url: mediaURL)))
        }
    }
    
    private func setParametersAndHeaders(for url: ApiUrl) {
        if url == ApiUrl.pexelsImage || url == ApiUrl.pexelsVideo {
            headers = [.authorization(bearerToken: tokens.pexels.rawValue)]
            parameters = ["query": category,
                          "page": "\(Int.random(in: 1..<100))"]
        } else if url == ApiUrl.pixabayImage || url == ApiUrl.pixabayVideo {
            parameters["key"] = tokens.pixabay.rawValue
            headers = []
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
