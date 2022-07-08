//
//  NetworkManager.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

struct NetworkManager {
    
    static var shared = NetworkManager()
    
    ///this is an alternative for data(from:delegate:) method that is available only for iOS 15.0+
    func getData(from url: URL) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation{ continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data, let response = response {
                    continuation.resume(returning: (data, response))
                }
            }.resume()
        }
    }
    
}
