//
//  ExerciseCellViewModelTests.swift
//  ExercisesTests
//
//  Created by Ahmad Ismail on 10/07/2022.
//

import XCTest
@testable import Exercises

class ExerciseCellViewModelTests: XCTestCase {
    
    var viewModel: ExerciseCellViewModel!
    
    func testMainImageIsNilIfImagesAreEmpty() {
        viewModel = ExerciseCellViewModel(exercise: DummyExercise.noImagesExercise)
        XCTAssertTrue(viewModel.mainImage == nil)
    }
    
    func testMainImageIsNilIfImagesHasNoMainImage() {
        viewModel = ExerciseCellViewModel(exercise: DummyExercise.noMainImageExercise)
        XCTAssertTrue(viewModel.mainImage == nil)
    }
    
    func testMainImageIsNotNilIfImagesAreNotEmpty() {
        viewModel = ExerciseCellViewModel(exercise: DummyExercise.defaultExercise)
        XCTAssertTrue(viewModel.mainImage != nil)
    }

}
