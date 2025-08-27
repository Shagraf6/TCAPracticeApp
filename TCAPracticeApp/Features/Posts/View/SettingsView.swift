//
//  SettingsView.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 27/08/2025.
//

import SwiftUI

import ComposableArchitecture



struct SettingsView: View {
    @Bindable var store: StoreOf<SettingsFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            List {
                Section(header: Text("Posts")) {
                    Button(role: .destructive) {
                        viewStore.send(.deleteAllPostsTapped)
                    } label: {
                        Text("Delete All Posts")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
