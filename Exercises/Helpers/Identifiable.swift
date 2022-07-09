//
//  Identifiable.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

struct IdentifiableError: Identifiable {
    let id = UUID()
    let error: Error
}
