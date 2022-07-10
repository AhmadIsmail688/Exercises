//
//  MockExercisesService.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

class MockExercisesService: ExercisesService {
    
    var isGetAllExercisesCalled = false
    var allExercisesReturned = ExercisesResponse(results: [DummyExercise.defaultExercise])
    
    var isGetExerciseWithIdCalled = false
    
    func getAllExercises() async throws -> ExercisesResponse {
        isGetAllExercisesCalled = true
        return allExercisesReturned
    }
    
    func getExercise(id: Int) async throws -> Exercise {
        isGetExerciseWithIdCalled = true
        return DummyExercise.defaultExercise
    }
    
    
}
