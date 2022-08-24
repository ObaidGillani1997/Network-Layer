//
//  Decoder.swift
//  Network-Layer
//
//  Created by Obaid on 16/07/2022.
//

import Foundation
struct ResponseDecoder {
    static func decodeData<T: Decodable>(type: T.Type, data: Data ) throws -> T {
        do {
            let result = try JSONDecoder().decode(type.self, from: data)
            return result
        } catch {
            throw error
        }
    }
}
