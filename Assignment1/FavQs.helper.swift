//
//  FavQs.helper.swift
//  Assignment1
//
//  Created by Navjot Singh on 2023-02-08.
//

import Foundation

enum FavQsApiErrors: Error {
    case unableToConvertUrl
    case Invalid_URL
}

class FavQs_Helper{
    
    static let urlString = "https://favqs.com/api/qotd"
    
    static func fetchFavQs() async throws -> Any {
        guard
            let url = URL(string: urlString)
        else { throw FavQsApiErrors.unableToConvertUrl }
        
        let (data, _) = try await
            URLSession.shared.data(from: url)
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        
        return jsonObject
    }
    
}

