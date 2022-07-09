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
        VStack(spacing: 0) {
            image
            Divider()
            text
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 1)
    }
    
    var image: some View {
        KFImage(viewModel.mainImage)
            .resizable()
            .placeholder{
                Image("exercisePlaceholder")
                    .resizable()
                    .foregroundColor(.secondary)
                    .padding(7)
            }
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(height: 150)
    }
    
    var text: some View {
        Text(viewModel.name)
            .font(.callout)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .frame(height: 50)
            .padding(6)
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(viewModel: ExerciseCellViewModel(exercise: DummyExercise.defaultExercise))
    }
}
