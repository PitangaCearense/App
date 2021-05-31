//
//  ResponseMediaProtocol.swift
//  App
//
//  Created by Ronaldo Gomes on 25/05/21.
//

import Foundation

protocol ResponseMediaProtocol: Codable {
    associatedtype Images: MediaInformation, ImageData
    associatedtype Videos: MediaInformation, VideoData

    var photos: [Images]? { get }
    var videos: [Videos]? { get }
}

protocol MediaInformation: Codable {
    var author: String? { get }
    var title: String? { get }
}

protocol ImageData: Codable {
    var imageSource: String { get }
}

protocol VideoData: Codable {
    var videoURL: String? { get }
}

protocol ResponsePictureProtocol: Codable {
    associatedtype Picture: MediaInformation, PictureData

    var picture: [Picture]? { get }
}

protocol PictureData: Codable {
    var pictureUrl: String? { get }
}

protocol ResponsePoetryProtocol: MediaInformation {
    var lines: [String] { get }
}
