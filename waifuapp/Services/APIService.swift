//
//  ApiService.swift
//  waifuapp
//
//  Created by Alzea Arafat on 03/03/24.
//

import Foundation

class APIService {
    
    var waifus = [Waifu]()
    
    // MARK: Set the URL strings
    let baseURL: String = "https://api.waifu.im/search?many=true"
    let category: String = "waifu"
    let orientation: String = "portrait"
    let isNSFW: Bool = false
    
    // MARK: This function will returns an array of Waifu or throws an error
    func fetchData() async throws -> [Waifu] {
        // MARK: Create URL
        guard let url = URL(string: "\(baseURL)&included_tags=\(category)&orientation=\(orientation)&is_nsfw=\(isNSFW)") else {
            throw NSError(domain: "APIServiceError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // MARK: Decode the data to Swift Object
        let decodeResponse = try JSONDecoder().decode(WaifuResponse.self, from: data)
        return decodeResponse.images
    }
}
