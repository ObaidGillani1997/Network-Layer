//
//  Networking.swift
//  Network-Layer
//
//  Created by Obaid on 15/07/2022.
//

import Foundation
protocol Networking {
    func execute<T: Decodable>(request: URLRequestable, type: T.Type, completionHandler: @escaping (Result<T, NetworkError>) -> Void)
    func cancel()
}

