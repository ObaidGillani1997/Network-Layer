//
//  MoviesEndPoint.swift
//  Network-Layer
//
//  Created by Obaid on 24/07/2022.
//

import Foundation

enum TodoAPI {
    case getTodo
    case getTodoById(String)
}
extension TodoAPI: EndPoint {
    
    var envirmentURLString: String {
        switch NetworkEnvironment.getCurrentEnviroment() {
        case .qa:
            return "https://jsonplaceholder.typicode.com"
        case .production:
            return "https://jsonplaceholder.typicode.com"
        case .staging:
            return "https://jsonplaceholder.typicode.com"
        }
    }
    
    var baseURL: URL {
        return URL(string: path)!
    }
    
    var path: String {
        switch self {
        case .getTodo:
            return  "\(envirmentURLString)/todos"
        case .getTodoById(let id):
            return  "\(envirmentURLString)/todos/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getTodo:
            return .get
        case .getTodoById(_):
            return .post
        }
    }
    
    var httpTask: HTTPTask {
        switch self {
        case .getTodo:
            return .request
        case .getTodoById(let id):
            return.requestParameters(["id": id])
        }
    }
}
