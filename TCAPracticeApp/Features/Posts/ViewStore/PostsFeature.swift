//
//  PostsFeature.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 25/08/2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct PostsFeature {

    @ObservableState
    struct State: Equatable {
        var posts: [Post] = []
        var isLoading = false
        var errorMessage: String?

        @Presents var destination: Destination.State?
    }

    @CasePathable
    enum Action {
        case loadPosts
        case postsResponse(Result<[Post], Error>)

        case postTapped(Post)
        case settingsTapped

        case destination(PresentationAction<Destination.Action>)
    }

    @Dependency(\.postClient) var postClient

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loadPosts:
                state.isLoading = true
                state.errorMessage = nil
                return .run { send in
                    do {
                        let posts = try await postClient.fetchPosts()
                        await send(.postsResponse(.success(posts)))
                    } catch {
                        await send(.postsResponse(.failure(error)))
                    }
                }

            case let .postsResponse(.success(posts)):
                state.isLoading = false
                state.posts = posts
                return .none

            case let .postsResponse(.failure(error)):
                state.isLoading = false
                state.errorMessage = error.localizedDescription
                return .none

            case let .postTapped(post):
                state.destination = .postDetail(PostDetailFeature.State(post: post))
                return .none

            case .settingsTapped:
                state.destination = .settings(SettingsFeature.State())
                return .none

            // 🔹 Delete all posts action from Settings
            case .destination(.presented(.settings(.deleteAllPostsTapped))):
                state.posts = []
               // state.destination = nil
                // Pop the last screen (Settings) from the stack
//                state.path.pop()
               // return .none
                return .send(.destination(.dismiss)) // This moves back

            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
    }
}

extension PostsFeature {
    @Reducer
    struct Destination {
        enum State: Equatable {
            case postDetail(PostDetailFeature.State)
            case settings(SettingsFeature.State)
        }

        enum Action {
            case postDetail(PostDetailFeature.Action)
            case settings(SettingsFeature.Action)
        }

        var body: some ReducerOf<Self> {
            Scope(state: \.postDetail, action: \.postDetail) {
                PostDetailFeature()
            }
            Scope(state: \.settings, action: \.settings) {
                SettingsFeature()
            }
        }
    }
}
