//
//  PostDetailView.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 27/08/2025.
//


import SwiftUI
import ComposableArchitecture

struct PostDetailView: View {
    let store: StoreOf<PostDetailFeature>
  
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(viewStore.post.title)
                        .font(.title2)
                        .bold()
                    
                    Text(viewStore.post.body)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("User ID: \(viewStore.post.userId)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .navigationTitle("Post Detail")
        }
    }
}

