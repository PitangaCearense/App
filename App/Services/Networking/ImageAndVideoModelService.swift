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
    
    func getImageResponse(for url: ApiUrl) -> ImageAndVideoResponseData {
        var imageResponse: ImageAndVideoResponseData?
        setParametersAndHeaders(for: url)
        
        if url == ApiUrl.pexelsImage {
            AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: PexelsModel.self) { response in
                let apiResponse = try! JSONDecoder().decode(PexelsModel.self, from: response.data!)
                let randomResponse = apiResponse.photos?.randomElement()
                imageResponse = ImageAndVideoResponseData(author: randomResponse!.photographer, url: randomResponse!.src.mediumUrl)
            }
        } else if url == ApiUrl.pixabayImage {
            AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: PixabayModel.self) { response in
                let apiResponse = try! JSONDecoder().decode(PixabayModel.self, from: response.data!)
                let randomResponse = apiResponse.hits.randomElement()
                imageResponse = ImageAndVideoResponseData(author: randomResponse!.user!, url: randomResponse!.largeImageURL!)
            }
        }
        
        return imageResponse!
    }
    
    func getVideoResponse(for url: ApiUrl) -> ImageAndVideoResponseData {
        var videoResponse: ImageAndVideoResponseData?
        setParametersAndHeaders(for: url)
        
        if url == ApiUrl.pexelsVideo {
            AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: PexelsModel.self) { response in
                let apiResponse = try! JSONDecoder().decode(PexelsModel.self, from: response.data!)
                let randomResponse = apiResponse.videos?.randomElement()
                videoResponse = ImageAndVideoResponseData(author: randomResponse!.user.name, url: randomResponse!.video_files.first!.link)
            }
        } else if url == ApiUrl.pixabayVideo {
            AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: PixabayModel.self) { response in
                let apiResponse = try! JSONDecoder().decode(PixabayModel.self, from: response.data!)
                let randomResponse = apiResponse.hits.randomElement()
                videoResponse = ImageAndVideoResponseData(author: randomResponse!.user!, url: (randomResponse!.videos?.medium.url)!)
            }
        }
        
        return videoResponse!
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
