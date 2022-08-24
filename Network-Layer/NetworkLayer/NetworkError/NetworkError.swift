//
//  NetworkError.swift
//  Network-Layer
//
//  Created by Obaid on 15/07/2022.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case decodingError
    case noData
    case customError(message: String)
}
