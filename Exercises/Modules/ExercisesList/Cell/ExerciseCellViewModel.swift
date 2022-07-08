//
//  ExerciseCellViewModel.swift
//  Exercises
//
//  Created by Ahmad Ismail on 08/07/2022.
//

import Foundation

struct ExerciseCellViewModel: Identifiable {
    
    let exercise: Exercise
    
    var id: Int {
        exercise.id
    }
    
    var name: String {
        exercise.name
    }
    
    var mainImage: URL? {
        exercise.images.filter{$0.isMain}.first?.image
    }
}
