//
//  GameOfThrones.helper.swift
//  Assignment1
//
//  Created by Navjot Singh on 2023-02-08.
//

import Foundation

enum GameOfThronesApiErrors: Error {
    case unableToConvertUrl
    case Invalid_URL
}

class GameOfThrones_Helper{
    
    static let urlString = "https://api.gameofthronesquotes.xyz/v1/houses"
    
    static func fetchGameOfThronesData() async throws -> Any {
        guard
            let url = URL(string: urlString)
        else { throw GameOfThronesApiErrors.unableToConvertUrl }
        
        let (data, _) = try await
            URLSession.shared.data(from: url)
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        
        return jsonObject
    }
    
}
