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
    
    // previous and next button size
    let skipButtonSize: CGFloat = 60
    // pause and play button size
    let playButtonSize: CGFloat = 80
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: controller.player)
            
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image("previous")
                        .frame(width: skipButtonSize, height: skipButtonSize)
                        .background(
                            Circle()
                                .fill(Color.white)
                                .overlay(Circle().stroke(Color.black))
                        )
                }
                
                Button(action: {}) {
                    Image("play")
                        .frame(width: playButtonSize, height: playButtonSize)
                        .background(
                            Circle()
                                .fill(Color.white)
                                .overlay(Circle().stroke(Color.black))
                        )
                }
                
                Button(action: {}) {
                    Image("next")
                        .frame(width: skipButtonSize, height: skipButtonSize)
                        .background(
                            Circle()
                                .fill(Color.white)
                                .overlay(Circle().stroke(Color.black))
                        )
                }
            }
        }
    }
}
