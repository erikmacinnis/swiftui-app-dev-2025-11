//
//  VideoService.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

protocol VideoServiceProtocol {
    // fetch videos from backend
    func getVideos() async throws -> [VideoModel]
}
