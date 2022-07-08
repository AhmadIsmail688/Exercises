//
//  ExercisesService.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

protocol ExercisesService {
    func getExercises() async throws -> ExercisesResponse
}

extension NetworkManager: ExercisesService {
    func getExercises() async throws -> ExercisesResponse {
        let api = ExercisesApi.getExercises
        let (data, _) = try await getData(from: api.url)
        return try JsonDecoder.default.decode(ExercisesResponse.self, from: data)
    }
    
}

