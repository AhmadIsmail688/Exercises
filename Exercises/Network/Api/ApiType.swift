//
//  ApiType.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

protocol ApiType {
    var baseURL: String { get }
    var path: String { get }
    var url: URL {get}
}

extension ApiType {
    var url: URL {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            fatalError("URL could not be configured")
        }
        return url
    }
}
