//
//  PoetryModelServices.swift
//  App
//
//  Created by Ronaldo Gomes on 24/05/21.
//

import Foundation
import Alamofire

class PoetryModelServices: ModelServices {
    var headers: HTTPHeaders!
    var category: String
    var parameters: [String : String]!
    
    init(category: String) {
        self.category = category
    }
    
    func getPoetryResponse(for url: ApiUrl) -> PoetryResponseData {
        var poetryResponse: PoetryResponseData?
        
        AF.request(url.rawValue).responseDecodable(of: [PoetryDBModel].self) { response in
            let apiResponse = try! JSONDecoder().decode([PoetryDBModel].self, from: response.data!)
            let randomResponse = apiResponse.randomElement()
            poetryResponse = PoetryResponseData(title: randomResponse!.title,
                                                author: randomResponse!.author,
                                                poetry: (randomResponse?.lines.reduce("", { $0 + "\n" + $1 }))!)
        }
        
        return poetryResponse!
    }
}
