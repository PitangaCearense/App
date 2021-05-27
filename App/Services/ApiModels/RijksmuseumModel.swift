//
//  RijksmuseumModel.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation

struct RijksmuseumModel: ResponsePictureProtocol, Codable {
    let artObjects: [ArtObject]

    var picture: [ArtObject]? { artObjects.filter{ $0.title != nil }}
}

struct ArtObject: MediaInformation, PictureData, Codable {
    var author: String?
    var title: String?
    let webImage: Picture

    var pictureUrl: String? { return webImage.url }
}

struct Picture: Codable {
    let url: String
}
