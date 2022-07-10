//
//  ExerciseDetailsViewModelTests.swift
//  ExercisesTests
//
//  Created by Ahmad Ismail on 10/07/2022.
//

import XCTest
@testable import Exercises

class ExerciseDetailsViewModelTests: XCTestCase {

    var viewModel: ExerciseDetailsViewModel!
    let exercisesService = MockExercisesService()
    
    @MainActor func testGetExerciseWithIdCalledIfVariationsAreNotEmpty() {
        viewModel = ExerciseDetailsViewModel(service: exercisesService, exercise: DummyExercise.defaultExercise)
        Task {
            await viewModel.getVariations()
            XCTAssertTrue(exercisesService.isGetExerciseWithIdCalled)
        }
    }
    
    @MainActor func testGetExerciseWithIdNotCalledIfVariationsAreEmpty() {
        viewModel = ExerciseDetailsViewModel(service: exercisesService, exercise: DummyExercise.noVariationsExercise)
        Task {
            await viewModel.getVariations()
            XCTAssertFalse(exercisesService.isGetExerciseWithIdCalled)
        }
    }

}
