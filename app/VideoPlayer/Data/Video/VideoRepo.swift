//
//  VideoRepoProtocol.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import Foundation

protocol VideoRepoProtocol {
    // fetch videos from memory or service
    func getVideos() async throws -> [VideoModel]
}

@Observable
final class VideoRepo: VideoRepoProtocol {
    // connection to the backend
    let videoService: VideoServiceProtocol
    
    // all videos in memory
    var videos: [VideoModel]
    // used to determine if we should refresh videos
    var lastFetchTime: Date?
    // how long before videos in memory become stale
    private let memoryDuration: TimeInterval = 300 // 5 minutes
    
    init(videoService: VideoServiceProtocol) {
        self.videoService = videoService
        self.videos = []
    }
    
    // Determine if we should fetch from backend again
    private func isStale() -> Bool {
        guard let lastFetch = lastFetchTime else {
            return true
        }
        
        let timeSinceLastFetch = Date().timeIntervalSince(lastFetch)
        
        return timeSinceLastFetch > memoryDuration
    }
    
    func getVideos() async throws -> [VideoModel] {
        // return videos in memory if not empty or stale
        if !videos.isEmpty && !isStale() {
            return videos
        }
        
        do {
            let fetchedVideos = try await videoService.getVideos()
            let sortedVideos = fetchedVideos.sorted {
                $0.publishedAt > $1.publishedAt
            }
            
            // update last fetched
            lastFetchTime = Date.now
            // saving videos to memory
            videos = sortedVideos
            
            return sortedVideos
        } catch {
            // simply rethrowing error
            print("Failed to fetch video in VideoRepo: \(error)")
            throw error
        }
    }
}
