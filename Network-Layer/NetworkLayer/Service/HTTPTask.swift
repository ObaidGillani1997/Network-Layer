//
//  HTTPTask.swift
//  Network-Layer
//
//  Created by Obaid on 24/07/2022.
//

import Foundation
public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

public enum HTTPTask {
    case request
    case requestParameters(Parameters)
    case requestParametersAndHeaders(Parameters, HTTPHeaders)
}
