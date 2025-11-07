//
//  GlobalSettings.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import Foundation

// all environment settings fetched from schemas
enum GlobalSettings {
    
    // baseurl for the backend
    static var baseURL: String {
        guard let baseURL = ProcessInfo.processInfo.environment["BASE_URL"] as String?, !baseURL.isEmpty else {
                return ""
            }
        
        return baseURL
    }
}
