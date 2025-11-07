//
//  VideoService.swift
//  VideoPlayer
//
//  Created by Erik MacInnis on 2025-11-07.
//

import Foundation

protocol VideoServiceProtocol {
    // fetch videos from backend
    func getVideos() async throws -> [VideoModel]
}

final class VideoService: VideoServiceProtocol {
    // private let baseURL = GlobalSettings.baseURL
    // avoiding making this annoying for you to run
    private let baseURL = "http://localhost:4000"
    private let pathURL = "/videos"
    
    // fetching videos from backend
    func getVideos() async throws -> [VideoModel] {
        guard let url = URL(string: "\(baseURL)\(pathURL)") else {
            throw ServiceError.invalidURL
        }
        
        do {
            // fetch data from url
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decoding json into list of videos
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            return try decoder.decode([VideoModel].self, from: data)
        } catch let decodingError as DecodingError {
            print("Decoding error: \(decodingError)")
            throw ServiceError.decodingError
        } catch {
            throw ServiceError.networkError
        }
    }
}
