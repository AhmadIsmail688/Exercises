//
//  ExercisesService.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

protocol ExercisesService {
    func getAllExercises() async throws -> ExercisesResponse
    func getExercise(id: Int) async throws -> Exercise
}

extension NetworkManager: ExercisesService {
    func getAllExercises() async throws -> ExercisesResponse {
        let api = ExercisesApi.getAllExercises
        let (data, _) = try await getData(from: api.url)
        return try JsonDecoder.default.decode(ExercisesResponse.self, from: data)
    }
    
    func getExercise(id: Int) async throws -> Exercise {
        let api = ExercisesApi.getExercise(id: id)
        let (data, _) = try await getData(from: api.url)
        return try JsonDecoder.default.decode(Exercise.self, from: data)
    }
    
}

