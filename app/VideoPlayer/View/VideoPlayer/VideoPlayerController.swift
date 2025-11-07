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
    var isPlaying: Bool = false
    var currentVideoIndex: Int = 0
    var currentVideo: VideoModel?
    // is showing buttons over video
    var showsControls = true
    var isLoading = true
    var errorMessage: String?
    
    init() {
        Task {
            // Fetching videos immediately
            await getVideos()
        }
    }
    
    // gets videos and always displays the first video
    func getVideos() async {
        isLoading = true
        errorMessage = nil
        
        do {
            videos = try await DependencyContainer.shared.videoRepo.getVideos()
            if !videos.isEmpty {
                // always displaying the first video
                setPlayer(video: videos[0])
            }
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = "Failed to load videos"
            print("Failed to fetch videos in VideoController: \(error)")
        }
    }
    
    // Creates the player with hlsURL and using mp4 as fallback
    func setPlayer(video: VideoModel) {
        // cleaning up previous player
        player?.pause()
        player = nil
        
        // setting the current video
        currentVideo = video
        
        // try HLS first
        if let hlsURL = URL(string: video.hlsURL) {
            
            player = AVPlayer(url: hlsURL)
        }
        // fallback to mp4
        else if let mp4URL = URL(string: video.fullURL) {
            player = AVPlayer(url: mp4URL)
        }
        
        guard let player = player else { return }
        
        // Playing the new video if the previous was already playing
        if isPlaying {
            player.play()
            showsControls = false
        }
    }
    
    // Called when pausing or playing the video
    // Updating the isPlaying state and player state
    func togglePlayPause() {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
            showsControls = false
        }
    }
    
    func playPrevious() {
        guard !videos.isEmpty else { return }
        
        // do nothing if video if first video is being displayed
        if currentVideoIndex > 0 {
            currentVideoIndex -= 1
            setPlayer(video: videos[currentVideoIndex])
        }
    }
    
    func playNext() {
        guard !videos.isEmpty else { return }
        
        // do nothing if last video is being displayed
        if currentVideoIndex < videos.count - 1 {
            currentVideoIndex += 1
            setPlayer(video: videos[currentVideoIndex])
        }
    }
}
