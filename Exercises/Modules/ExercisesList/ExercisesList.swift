//
//  ExercisesList.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import SwiftUI

struct ExercisesList: View {
    
    @ObservedObject var viewModel = ExercisesListViewModel()
    
    var body: some View {
        NavigationView {
            exercisesPage
                .navigationTitle("Exercises")
        }
        .onAppear{
            Task { await viewModel.getExercises() }
        }
        .alert(item: $viewModel.error) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.error.localizedDescription)
            )
        }

    }
    
    @ViewBuilder
    var exercisesPage: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            cellsGrid
        }
    }
    
    var cellsGrid: some View {
        let gridItem = GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 15)
        let columns = [gridItem, gridItem]
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(viewModel.exercises) { exerciseViewModel in
                    ExerciseCell(viewModel: exerciseViewModel)
                }
            }
            .padding()
        }
    }
}

struct ExercisesList_Previews: PreviewProvider {
    static let exercises = Array(repeating: DummyExercise.defaultExercise, count: 6)
    static var previews: some View {
        ExercisesList(
            viewModel: ExercisesListViewModel(
                exercises: exercises.map{ExerciseCellViewModel(exercise: $0)}
            )
        )
    }
}
