//
//  ExerciseCell.swift
//  Exercises
//
//  Created by Ahmad Ismail on 08/07/2022.
//

import SwiftUI
import Kingfisher

struct ExerciseCell: View {
    
    var viewModel: ExerciseCellViewModel

    var body: some View {
        VStack(spacing: 10) {
            image
            text
        }
        .padding()
    }
    
    var image: some View {
        ZStack {
            Image(systemName: "figure.walk")
                .resizable()
                .foregroundColor(.secondary)
            KFImage(viewModel.mainImage)
                .resizable()
        }
        .aspectRatio(contentMode: .fit)
        .padding()
    }
    
    var text: some View {
        Text(viewModel.name)
            .font(.body)
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(viewModel: ExerciseCellViewModel(exercise: DummyExercise.defaultExercise))
    }
}
