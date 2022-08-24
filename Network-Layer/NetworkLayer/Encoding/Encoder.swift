//
//  Encoder.swift
//  Network-Layer
//
//  Created by Asad Khan on 7/30/22.
//

import Foundation
struct RequestEncoder {
    static func encodeRequest<T: Encodable>( request: inout URLRequest,  data: T) throws {
        do {
            let httpBody = try JSONEncoder().encode(data)
            request.httpBody = httpBody
        } catch {
            throw error
        }
    }
}
