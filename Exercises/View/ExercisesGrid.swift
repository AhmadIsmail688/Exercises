//
//  ExercisesGrid.swift
//  Exercises
//
//  Created by Ahmad Ismail on 10/07/2022.
//

import SwiftUI

struct ExercisesGrid: View {
    
    let exercises: [ExerciseCellViewModel]

    var body: some View {
        let gridItem = GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 15)
        let columns = [gridItem, gridItem]
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(exercises) { exerciseViewModel in
                NavigationLink {
                    ExerciseDetails(exercise: exerciseViewModel.exercise)
                } label: {
                    ExerciseCell(viewModel: exerciseViewModel)
                }
            }
        }
        .padding()
    }
}

struct ExercisesGrid_Previews: PreviewProvider {
    static let exercises = Array(repeating: DummyExercise.defaultExercise, count: 6)
    static var previews: some View {
        ExercisesGrid(exercises: exercises.map{ExerciseCellViewModel(exercise: $0)})
    }
}
