//
//  Post.swift
//  TCAPracticeApp
//
//  Created by MACBOOK on 25/08/2025.
//

import Foundation

struct Post: Equatable, Identifiable, Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
