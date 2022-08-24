//
//  NetworkEnvironment.swift
//  Network-Layer
//
//  Created by Obaid on 24/07/2022.
//

import Foundation

enum Environments {
    case qa
    case production
    case staging
}

struct NetworkEnvironment {
   static func getCurrentEnviroment() -> Environments {
        return .production
    }
}
