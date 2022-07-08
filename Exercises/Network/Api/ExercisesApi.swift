//
//  ExercisesApi.swift
//  Exercises
//
//  Created by Ahmad Ismail on 09/07/2022.
//

import Foundation

enum ExercisesApi {
    case getExercises
}

extension ExercisesApi: ApiType {
    var baseURL: String {
        "https://wger.de/api/v2"
    }
    
    var path: String {
        switch self {
        case .getExercises: return "/exerciseinfo"
        }
    }
    
    
}
