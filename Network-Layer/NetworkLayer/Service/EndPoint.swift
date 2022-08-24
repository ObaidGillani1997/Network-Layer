//
//  EndPoint.swift
//  Network-Layer
//
//  Created by Obaid on 15/07/2022.
//

import Foundation

protocol EndPoint {
    var envirmentURLString: String { get }
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpTask: HTTPTask { get }
}
