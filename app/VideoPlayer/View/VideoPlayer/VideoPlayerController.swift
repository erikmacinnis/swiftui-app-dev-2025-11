//
//  VideoPlayerController.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import Foundation
import AVKit

// Handles all app state and business logic
// View listens for changes
@Observable
final class VideoPlayerController {
    var videos: [VideoModel] = []
    var player: AVPlayer?
    
    init() {
        Task {
            // Fetching videos immediately
            await getVideos()
        }
    }
    
    func getVideos() async {
        videos = MockVideoData.sampleVideos
        
        if !videos.isEmpty {
            setPlayer(video: videos[0])
        }
    }
    
    // Creates the player with hlsURL and using mp4 as fallback
    func setPlayer(video: VideoModel) {
        // try HLS first
        if let hlsURL = URL(string: video.hlsURL) {
            player = AVPlayer(url: hlsURL)
        }
        // fallback to mp4
        else if let mp4URL = URL(string: video.fullURL) {
            player = AVPlayer(url: mp4URL)
        }
    }
}
