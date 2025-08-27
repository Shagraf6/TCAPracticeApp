//
//  PostClient.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 25/08/2025.
//

import Foundation
import ComposableArchitecture


struct PostClient {
    var fetchPosts: @Sendable () async throws -> [Post]
  //  var deletePost: @Sendable () async throws -> [Post]

}

extension PostClient {
    static let live = PostClient(
        fetchPosts: {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([Post].self, from: data)
        }
        //,
        
//        deletePost: {
//            
//        }
    )
}


extension PostClient: DependencyKey {
    static let liveValue = PostClient.live
}

extension DependencyValues {
    var postClient: PostClient {
        get { self[PostClient.self] }
        set { self[PostClient.self] = newValue }
    }
}
