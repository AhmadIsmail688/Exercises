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
        images: [defaultImage],
        variations: [55,5]
    )
    
    
    static let defaultImage = Exercise.Image(
        id: 121,
        image: URL(string: "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")!,
        isMain: true
    )
    
}
