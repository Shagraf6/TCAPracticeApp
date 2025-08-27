//
//  TCAPracticeAppApp.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 25/08/2025.
//

import SwiftUI
import ComposableArchitecture


@main
struct TCAPracticeAppApp: App {
    var body: some Scene {
        WindowGroup {
            //            TabView {
            //                           UsersView(
            //                               store: Store(
            //                                   initialState: UsersFeature.State(),
            //                                   reducer: { UsersFeature() }
            //                               )
            //                           )
            //                           .tabItem { Label("Users", systemImage: "person.3") }
            //
            PostsView(
                store: Store(
                    initialState: PostsFeature.State(),
                    reducer: { PostsFeature()
                        
                    }
                ))
            //                           )
            //                           .tabItem { Label("Posts", systemImage: "doc.text") }
            //                       }
        }
    }
}


