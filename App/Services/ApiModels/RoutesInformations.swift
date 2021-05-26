//
//  RoutesInformations.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation
import Alamofire

enum Routes: String {
    case pexelsImage = "https://api.pexels.com/v1/search"
    case pexelsVideo = "https://api.pexels.com/videos/search"
    case pixabayImage = "https://pixabay.com/api/"
    case pixabayVideo = "https://pixabay.com/api/videos/"
    case rijksmuseum = "https://www.rijksmuseum.nl/api/en/collection"
    case poetrydb = "https://poetrydb.org/random"
//
//    var pexelsParameters: [String : String] {
//        return ["query": category, "page": "\(Int.random(in: 1..<100))"]
//    }
//
//    var pexelsHeaders: [HTTPHeader] {
//        return [.authorization(bearerToken: tokens.pexels.rawValue)]
//    }
//
//    var pixabayParameters: [String: String] {
//        return ["key": tokens.pixabay.rawValue,
//                "category": category]
//    }
//
//    var pixabayHeaders: [HTTPHeader] {
//        return []
//    }
//
//    var rijksmuseumParamerts: [String: String] {
//        return ["key": tokens.rijksmuseum.rawValue,
//                "technique": "painting",
//                "p": "\(Int.random(in: 1..<1000))"]
//    }
//
//    var rijksmuseumHeaders: [HTTPHeader] {
//        return []
//    }
}

enum tokens: String {
    case pexels = "563492ad6f91700001000001d18b9d0dcabe44ffb5436ad57b3a52ee"
    case pixabay = "21586355-9a53b7219c21f55756e9566af"
    case rijksmuseum = "jCEuqrdy"
}
