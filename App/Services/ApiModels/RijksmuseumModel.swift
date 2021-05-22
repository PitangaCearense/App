//
//  RijksmuseumModel.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation

struct RijksmuseumModel: Codable {
    let artObjects: [ArtObject]
}

struct ArtObject: Codable {
    let title: String
    let webImage: Picture
}

struct Picture: Codable {
    let url: String
}
