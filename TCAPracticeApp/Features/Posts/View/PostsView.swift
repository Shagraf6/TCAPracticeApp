//
//  PostsView.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 25/08/2025.
//


import SwiftUI
import ComposableArchitecture


//struct PostsView: View {
//    let store: StoreOf<PostsFeature>
//    
//    var body: some View {
//        WithViewStore(store, observe: { $0 }) { viewStore in
//            NavigationStackStore(
//                store.scope(state: \.path, action: { .path($0) })
//            )
//            {
//                VStack {
//                    if viewStore.isLoading {
//                        ProgressView("Loading...")
//                    } else if let error = viewStore.errorMessage {
//                        Text("Error: \(error)")
//                            .foregroundColor(.red)
//                    } else {
//                        List(viewStore.posts) { post in
//                            Button {
//                                viewStore.send(.postTapped(post))
//                            } label: {
//                                VStack(alignment: .leading, spacing: 4) {
//                                    Text(post.title)
//                                        .font(.headline)
//                                    Text(post.body)
//                                        .font(.subheadline)
//                                        .foregroundColor(.secondary)
//                                }
//                                .padding(.vertical, 4)
//                            }
//                        }
//                    }
//                    
//                    Button("Load Posts") {
//                        viewStore.send(.loadPosts)
//                    }
//                    .padding()
//                }
//                .navigationTitle("Posts")
////            } destination: { state in
////                switch state {
////                case .postDetail:
////                    CaseLet(
////                        /PostsFeature.Path.State.postDetail,   // note the slash CasePath
////                        action: PostsFeature.Path.Action.postDetail,
////                        then: PostDetailView.init(store:)
////                    )
////                case .settings:
////                    CaseLet(
////                        /PostsFeature.Path.State.settings,    // slash CasePath for settings
////                        action: PostsFeature.Path.Action.settings,
////                        then: SettingsView.init(store:)
////                    )
////                }
////            }
//                
//        }
//    }
//}

    //
    //  PostsView.swift
    //  TCAPracticeApp
    //
    //  Created by MACBOOK on 25/08/2025.
    //

    import SwiftUI
    import ComposableArchitecture

    struct PostsView: View {
        @Bindable var store: StoreOf<PostsFeature>
        
        var body: some View {
            NavigationStack {
                VStack {
                    if store.isLoading {
                        ProgressView("Loading...")
                    } else if let error = store.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        List(store.posts) { post in
                            Button {
                                store.send(.postTapped(post))
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(post.title)
                                        .font(.headline)
                                    Text(post.body)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    Spacer()
                    HStack {
                        Button{
                            store.send(.loadPosts)
                        } label:{
                         Image(systemName: "arrow.trianglehead.counterclockwise")
                        }
                
                        Spacer()
                      
                               Button{
                                   store.send(.settingsTapped)
                               } label:{
                                   Image(systemName: "gearshape")  }
                      
                    }
                    .padding()
                }
                .onAppear{
              //      store.send(.loadPosts)
                }
                .navigationTitle("Posts")
                // 🔹 Presentation-driven navigation
                .navigationDestination(
                    item: $store.scope(state: \.destination?.postDetail,
                                       action: \.destination.postDetail)
                ) { store in
                    PostDetailView(store: store)
                }
                .navigationDestination(
                    item: $store.scope(state: \.destination?.settings,
                                       action: \.destination.settings)
                ) { store in
                    SettingsView(store: store)
                }
            }
        }
    }
