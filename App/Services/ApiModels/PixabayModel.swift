//
//  PixabayModel.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation

struct PixabayModel: ResponseMediaProtocol, Codable {
    var videos: [Hit]? { return hits?.filter { $0.videos != nil } }
    var photos: [Hit]? { return hits?.filter { $0.largeImageURL != nil } }
    
    var hits: [Hit]?
}

struct Hit: MediaInformation, VideoData, ImageData, Codable {
    var title: String?
    let user: String?
    let largeImageURL: String?
    let videos: QualityOfVideos?
    
    var author: String? { return user }
    var imageSource: String { largeImageURL ?? "" }
    var videoURL: String? { videos?.medium.url ?? "" }
}

struct QualityOfVideos: Codable {
    let medium: VideoInformation
}

struct VideoInformation: Codable {
    let url: String
}
