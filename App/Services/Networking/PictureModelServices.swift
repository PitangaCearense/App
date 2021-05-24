//
//  PictureModelServices.swift
//  App
//
//  Created by Ronaldo Gomes on 24/05/21.
//

import Foundation
import Alamofire

class PictureModelServices: ModelServices {
    var headers: HTTPHeaders!
    var category: String
    var parameters: [String : String]!
    
    init(category: String) {
        self.category = category
    }
    
    func getPictureResponse(for url: ApiUrl) -> PictureResponseData {
        var videoResponse: PictureResponseData?
        setParametersAndHeaders(for: url)
        
        AF.request(url.rawValue, parameters: parameters, headers: headers).responseDecodable(of: RijksmuseumModel.self) { response in
            let apiResponse = try! JSONDecoder().decode(RijksmuseumModel.self, from: response.data!)
            let randomResponse = apiResponse.artObjects.randomElement()
            videoResponse = PictureResponseData(title: randomResponse!.title, url: (randomResponse?.webImage.url)!)
        }
        
        return videoResponse!
    }
    
    private func setParametersAndHeaders(for url: ApiUrl) {
        parameters = ["key": tokens.rijksmuseum.rawValue,
                      "technique": "painting",
                      "p": "\(Int.random(in: 1..<1000))"]
        headers = []
    }
}
