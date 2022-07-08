//
//  MockExercisesService.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

class MockExercisesService: ExercisesService {
    
    var isGetExercisesCalled = false
    
    func getExercises() async throws -> ExercisesResponse {
        isGetExercisesCalled = true
        return ExercisesResponse(results: [DummyExercise.defaultExercise])
    }
    
}
