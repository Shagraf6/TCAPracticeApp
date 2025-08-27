//
//  PostDetailFeature.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 27/08/2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct PostDetailFeature {
    struct State: Equatable {
        let post: Post
    }
    
    enum Action {
        case none
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            // Nothing for now, but you could add comments fetching, etc.
            return .none
        }
    }
}
