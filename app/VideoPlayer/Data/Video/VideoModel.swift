//
//  VideoModel.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import Foundation

// Matching model for videos.ts file
struct VideoModel: Codable, Identifiable {
    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    var publishedAt: Date
    let author: Author
}

struct Author: Codable {
    let id: String
    let name: String
}
