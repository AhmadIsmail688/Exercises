//
//  Exercise.swift
//  Exercises
//
//  Created by Ahmad Ismail on 08/07/2022.
//

import Foundation

struct Exercise: Decodable {
    let id: Int
    let name: String
    let images: [Image]
    let variations: [Int]
    
    struct Image: Decodable {
        let id: Int
        let image: URL
        let isMain: Bool
    }
}
