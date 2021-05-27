//
//  NetworkWorkerDelegate.swift
//  App
//
//  Created by Pedro Sousa on 27/05/21.
//

import Foundation

protocol NetworkWorkerDelegate: AnyObject {
    func receivePhoto(result: Result<ImageAndVideoResponseData, NetworkErrors>)
    func receiveVideo(result: Result<ImageAndVideoResponseData, NetworkErrors>)
    func receivePoetry(result: Result<PoetryResponseData, NetworkErrors>)
    func receivePainting(result: Result<PictureResponseData, NetworkErrors>)
}
