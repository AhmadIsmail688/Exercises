//
//  ExercisesApi.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

enum ExercisesApi {
    case getAllExercises
    case getExercise(id: Int)
}

extension ExercisesApi: ApiType {
    var baseURL: String {
        "https://wger.de/api/v2"
    }
    
    var path: String {
        switch self {
        case .getAllExercises:
            return "/exerciseinfo"
        case .getExercise(let id):
            return "/exerciseinfo/\(id)"
        }
    }
    
    
}
