//
//  MockVideoService.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

final class MockVideoService: VideoServiceProtocol {
    // return mock video data
    func getVideos() async throws -> [VideoModel] {
        return MockVideoData.sampleVideos
    }
}
