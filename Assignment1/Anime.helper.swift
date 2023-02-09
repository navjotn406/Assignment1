//
//  Anime.helper.swift
//  Assignment1
//
//  Created by Navjot Singh on 2023-02-08.
//

import Foundation

enum AnimeApiErrors: Error {
    case unableToConvertUrl
    case Invalid_URL
}

class Anime_Helper{
    
    static let urlString = "https://animechan.vercel.app/api/quotes"
    
    static func fetchAnimeData() async throws -> Any {
        guard
            let url = URL(string: urlString)
        else { throw AnimeApiErrors.unableToConvertUrl }
        
        let (data, _) = try await
            URLSession.shared.data(from: url)
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        
        return jsonObject
    }
    
}




