//
//  PexelsModel.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation

struct PexelsModel: Codable {
    let page: Int
    let photos: [Photos]?
    let videos: [Videos]?
}

// MARK: - Image flow
struct Photos: Codable {
    let photographer: String
    let src: SRC
}

struct SRC: Codable {
    let mediumUrl: String
}

// MARK: - Video flow
struct Videos: Codable {
    let user: User
    let video_files: [VideosFiles]
}

struct User: Codable {
    let name: String
}

struct VideosFiles: Codable {
    let link: String
}
