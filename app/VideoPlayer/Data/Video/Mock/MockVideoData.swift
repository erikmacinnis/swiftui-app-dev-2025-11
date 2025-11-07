//
//  MockVideoData.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import Foundation

// Mock data copied from the server
struct MockVideoData {
    static let sampleVideos: [VideoModel] = [
        VideoModel(
            id: "2f1fe9c0-bdbf-4104-bee2-3c0ec514436f",
            title: "About EM:RAP",
            hlsURL: "https://d140vvwqovffrf.cloudfront.net/media/5e852de33c8e4/hls/index.m3u8",
            fullURL: "https://d140vvwqovffrf.cloudfront.net/media/5e852de33c8e4/full/720.mp4",
            description: "# Omnibus quae\n\n## Sit sed inque teneris\n\nLorem markdownum adhuc securosque, suo ponto satae se adhuc, terga.",
            publishedAt: ISO8601DateFormatter().date(from: "2018-12-14T21:09:00+0000")!, // Used claude to format date
            author: Author(
                id: "2cab326a-ab2f-4624-a6d7-2e1855fc5e4e",
                name: "Mel Herbert"
            )
        ),
        VideoModel(
            id: "6ec246b1-ad09-4e03-8573-21e2e779856c",
            title: "EM:RAP Global Outreach",
            hlsURL: "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/hls/index.m3u8",
            fullURL: "https://d140vvwqovffrf.cloudfront.net/media/5e87b9a811599/full/720.mp4",
            description: "# Famemque horrescere occasus neve\n\n## Ityosque oraque subvolat patetis\n\nLorem markdownum purpura Scyrum, ira aper cruribus purpurea.",
            publishedAt: ISO8601DateFormatter().date(from: "2019-12-15T22:17:00+0000")!,  // Used claude to format date
            author: Author(
                id: "2cab326a-ab2f-4624-a6d7-2e1855fc5e4e",
                name: "Mel Herbert"
            )
        )
    ]
}
