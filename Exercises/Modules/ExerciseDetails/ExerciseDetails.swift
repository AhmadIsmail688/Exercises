//
//  ExerciseDetails.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import SwiftUI
import Kingfisher

struct ExerciseDetails: View {
    
    @ObservedObject var viewModel: ExerciseDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if !viewModel.images.isEmpty {
                    images
                }
                title
                if !viewModel.variations.isEmpty {
                    variations
                } else {
                    noVariationsText
                }
                
            }
        }
        .navigationTitle("Exercise Details")
        .alert(item: $viewModel.error) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.error.localizedDescription)
            )
        }
    }
    
    var images: some View {
        TabView {
            ForEach(viewModel.images, id: \.self) { image in
                KFImage(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 300)
        .background(Color(UIColor.systemGray5))
    }
    
    var title: some View {
        HStack {
            Text(viewModel.title)
                .font(.title)
                .padding()
            Spacer()
        }
    }
    
    var variations: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Variations:")
                .font(.title3)
                .padding(.horizontal)
            ExercisesGrid(exercises: viewModel.variations)
        }
    }
    
    var noVariationsText: some View {
        Text("No variations available")
            .font(.footnote)
            .foregroundColor(Color(UIColor.secondaryLabel))
            .padding(.horizontal)
    }
    
}

extension ExerciseDetails {
    init(exercise: Exercise) {
        self.viewModel = ExerciseDetailsViewModel(exercise: exercise)
    }
}

struct ExerciseDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetails(viewModel: ExerciseDetailsViewModel(exercise: DummyExercise.defaultExercise))
    }
}
