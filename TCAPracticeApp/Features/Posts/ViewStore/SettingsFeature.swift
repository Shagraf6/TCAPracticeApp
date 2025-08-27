//
//  SettingsFeature.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 27/08/2025.
//

import Foundation


import ComposableArchitecture




@Reducer
struct SettingsFeature {
    @ObservableState
    struct State: Equatable {}

    @CasePathable
    enum Action {
        case deleteAllPostsTapped
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .deleteAllPostsTapped:
                return .none
            }
        }
    }
}
