//
//  URLRequestable.swift
//  Network-Layer
//
//  Created by Obaid on 16/07/2022.
//

import Foundation
protocol URLRequestable {
    var endPoint: EndPoint { get set }
    func getURLRequest() throws  -> URLRequest
}

struct Request: URLRequestable {
    
    internal var endPoint: EndPoint
    
    init(_endPoint: EndPoint) {
        endPoint = _endPoint
    }
    
    func getURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: endPoint.baseURL)
        urlRequest.httpMethod = endPoint.httpMethod.rawValue
        switch endPoint.httpTask {
        case .request: break
        case .requestParameters(let bodyParameter):
            try updateHttpBody(request: &urlRequest, param: bodyParameter)
        case .requestParametersAndHeaders(_, let additionHeaders):
            urlRequest.allHTTPHeaderFields = additionHeaders
        }
        
        return urlRequest
    }
    
    private func updateHttpBody(request: inout URLRequest,  param: Parameters) throws {
        do {
        let httpBodyData = try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
            request.httpBody = httpBodyData
        }
        catch {
            throw error
        }
    }
}
