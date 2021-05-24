//
//  ModelServices.swift
//  App
//
//  Created by Ronaldo Gomes on 24/05/21.
//

import Foundation
import Alamofire

protocol ModelServices {
    var headers: HTTPHeaders! { get }
    var category: String { get }
    var parameters: [String: String]! { get }
}
