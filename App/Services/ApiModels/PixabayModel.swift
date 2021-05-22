//
//  PixabayModel.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation

struct PixabayModel: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let user: String?
    let largeImageURL: String?
    let videos: QualityOfVideos?
}

struct QualityOfVideos: Codable {
    let medium: VideoInformation
}

struct VideoInformation: Codable {
    let url: String
}
