//
//  ExerciseDetailsViewModel.swift
//  Exercises
//
//  Created by Ahmad Ismail on 10/07/2022.
//

import Foundation

@MainActor class ExerciseDetailsViewModel: ObservableObject {
    
    let service: ExercisesService
    let exercise: Exercise
    
    init(service: ExercisesService = NetworkManager.shared, exercise: Exercise) {
        self.service = service
        self.exercise = exercise
        Task {await getVariations()}
    }
    
    @Published var variations = [ExerciseCellViewModel]()
    @Published var error: IdentifiableError?
        
    var images: [URL] {
        exercise.images.map{$0.image}
    }
    
    var title: String {
        exercise.name
    }
    
    func getVariations() async {
        for variationId in exercise.variations {
            await getExercise(id: variationId)
        }
    }
    
    func getExercise(id: Int) async {
        do {
            let exercise = try await service.getExercise(id: id)
            variations.append(ExerciseCellViewModel(exercise: exercise))
        } catch {
            self.error = IdentifiableError(error: error)
        }
    }
}
