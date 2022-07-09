//
//  ExercisesListViewModel.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

@MainActor class ExercisesListViewModel: ObservableObject {
    
    var service: ExercisesService
    
    @Published var exercises = [ExerciseCellViewModel]()
    @Published var error: IdentifiableError?
    @Published var isLoading = false
    
    init(service: ExercisesService = NetworkManager.shared, exercises: [ExerciseCellViewModel] = []) {
        self.service = service
        self.exercises = exercises
    }
    
    func getExercises() async {
        isLoading = true; defer {isLoading = false}
        do {
            self.exercises = try await service.getExercises().results.map{ExerciseCellViewModel(exercise: $0)}
        } catch {
            self.error = IdentifiableError(error: error)
        }
    }
}
