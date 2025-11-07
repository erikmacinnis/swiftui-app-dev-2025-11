//
//  VideoPlayerView.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // handles all app logic and states
    @State private var controller = VideoPlayerController()
    
    var body: some View {
        // Display video
        VideoPlayer(player: controller.player)
    }
}
