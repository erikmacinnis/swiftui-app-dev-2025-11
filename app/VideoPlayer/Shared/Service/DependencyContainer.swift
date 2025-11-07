//
//  DependencyContainer.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import Foundation

// class that initiates all instances
final class DependencyContainer {
    // referenced accessed within app
    static let shared = DependencyContainer()
    
    let videoRepo: VideoRepoProtocol
    
    private init() {
        // instantiating video repo
        self.videoRepo = VideoRepo(
            videoService: MockVideoService()
        )
    }
}
