//
//  PexelsModel.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation

struct PexelsModel: ResponseMediaProtocol, Codable {
    let page: Int
    let photos: [Photos]?
    let videos: [Videos]?
}

// MARK: - Image flow
struct Photos: Codable, MediaInformation, ImageData {
    var title: String?
    let author: String?
    let src: SRC

    var imageSource: String {
        return src.mediumUrl
    }

    enum CodingKeys: String, CodingKey {
        case author = "photographer"
        case src
    }
}

struct SRC: Codable {
    let mediumUrl: String
}

// MARK: - Video flow
struct Videos: MediaInformation, VideoData, Codable {
    var title: String?
    var author: String? { return user.name }
    //var imageSource: String
    
    let user: User
    var videoURL: String? { videoFiles.first?.link ?? "" }
    let videoFiles: [VideosFiles]
}

struct User: Codable {
    let name: String
}

struct VideosFiles: Codable {
    let link: String
}
