//
//  DummyExercise.swift
//  Exercises
//
//  Created by Ahmad Ismail on 08/07/2022.
//

import Foundation

struct DummyExercise {
    
    static let defaultExercise = Exercise(
        id: 5,
        name: "Ausfallschritte im Gehen",
        images: [mainImage, otherImage],
        variations: [55,5]
    )
    
    static let noMainImageExercise = Exercise(
        id: 38,
        name: "Bankdrücken Eng",
        images: [otherImage],
        variations: [38,58,25]
    )
    
    static let noImagesExercise = Exercise(
        id: 407,
        name: "Barbell Hack Squats",
        images: [],
        variations: [407,342,300]
    )
    
    static let noVariationsExercise = Exercise(
        id: 343,
        name: "Barbell Ab Rollout",
        images: [mainImage],
        variations: []
    )
    
    static let mainImage = Exercise.Image(
        id: 121,
        image: URL(string: "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")!,
        isMain: true
    )
    
    static let otherImage = Exercise.Image(
        id: 122,
        image: URL(string: "https://wger.de/media/exercise-images/113/Walking-lunges-2.png")!,
        isMain: false
    )
    
}
