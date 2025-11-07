//
//  VideoPlayerView.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import SwiftUI
import AVKit

// Displays the video player without the playback controls
// Got code from here: https://stackoverflow.com/questions/65927459/playback-controls-in-swiftui
struct CustomVideoPlayer: UIViewControllerRepresentable {
    let player: AVPlayer?
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.showsPlaybackControls = false
        controller.player = player
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}

struct VideoPlayerView: View {
    // handles all app logic and states
    @State private var controller = VideoPlayerController()
    
    var body: some View {
        // Display video
        CustomVideoPlayer(player: controller.player)
    }
}
