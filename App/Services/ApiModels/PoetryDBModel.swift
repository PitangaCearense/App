//
//  PoetryDBModel.swift
//  App
//
//  Created by Ronaldo Gomes on 22/05/21.
//

import Foundation

struct PoetryDBModel: ResponsePoetryProtocol, Codable {
    var title: String?
    var author: String?
    var lines: [String]
}
