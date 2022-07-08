//
//  JsonDecoder.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

struct JsonDecoder {
    static let `default`: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
