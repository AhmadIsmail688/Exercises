//
//  ExercisesListViewModelTests.swift
//  ExercisesTests
//
//  Created by Ahmad Ismail on 10/07/2022.
//

import XCTest
@testable import Exercises

class ExercisesListViewModelTests: XCTestCase {
    
    var viewModel: ExercisesListViewModel!
    let exercisesService = MockExercisesService()
    
    @MainActor func testGetExercisesCalled() {
        viewModel = ExercisesListViewModel(service: exercisesService)
        Task {
            await viewModel.getExercises()
            XCTAssertTrue(exercisesService.isGetAllExercisesCalled)
        }
    }
    
    @MainActor func testExercisesAreNotEmptyIfGetAllExercisesReturnedNonEmptyResponse() {
        exercisesService.allExercisesReturned = ExercisesResponse(results: [DummyExercise.defaultExercise])
        viewModel = ExercisesListViewModel(service: exercisesService)
        Task {
            await viewModel.getExercises()
            XCTAssertFalse(viewModel.exercises.isEmpty)
        }
    }
    
    @MainActor func testExercisesRemainEmptyIfGetAllExercisesReturnedEmptyResponse() {
        exercisesService.allExercisesReturned = ExercisesResponse(results: [])
        viewModel = ExercisesListViewModel(service: exercisesService)
        Task {
            await viewModel.getExercises()
            XCTAssertTrue(viewModel.exercises.isEmpty)
        }
    }
    
}
