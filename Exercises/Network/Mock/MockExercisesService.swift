//
//  MockExercisesService.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

class MockExercisesService: ExercisesService {
    
    var isGetExercisesCalled = false
    var isGetExerciseWithIdCalled = false
    
    func getAllExercises() async throws -> ExercisesResponse {
        isGetExercisesCalled = true
        return ExercisesResponse(results: [DummyExercise.defaultExercise])
    }
    
    func getExercise(id: Int) async throws -> Exercise {
        isGetExerciseWithIdCalled = true
        return DummyExercise.defaultExercise
    }
    
    
}
