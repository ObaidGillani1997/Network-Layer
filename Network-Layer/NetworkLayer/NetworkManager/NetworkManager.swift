//
//  NetworkManager.swift
//  Network-Layer
//
//  Created by Obaid on 15/07/2022.
//

import Foundation
class NetworkManager: Networking {
    
    static var shared: Networking = NetworkManager()
    
    private var task: URLSessionTask? = nil
    
    func execute<T: Decodable>(request: URLRequestable, type: T.Type, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        do {
            let urlRequest = try request.getURLRequest()
            self.task =  URLSession.shared.dataTask(with: urlRequest) { data, urlRequest, error in
                if let error = error {
                    completionHandler(.failure(.customError(message: error.localizedDescription)))
                    return
                }
                guard let data = data else {
                    completionHandler(.failure(.noData))
                    return
                }
                do {
                    let result = try ResponseDecoder.decodeData(type: type, data: data)
                    completionHandler(.success(result))
                } catch {
                    completionHandler(.failure(.decodingError))
                }
            }
            self.task?.resume()
        } catch(let error){
            completionHandler(.failure(.customError(message: error.localizedDescription)))
        }
        
    }
    
    func cancel() {
        task?.cancel()
    }
}
