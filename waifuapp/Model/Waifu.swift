//
//  Waifu.swift
//  waifuapp
//
//  Created by Alzea Arafat on 03/03/24.
//

import Foundation

struct WaifuResponse: Decodable {
    let images: [Waifu]
}

struct Waifu: Codable, Identifiable {
    // MARK: Use imageID as the unique identifier
    var id: Int { imageID }
    let imageID: Int
    let url: String?
    
    // MARK: Using CodingKeys to map 'image_id' from the JSON to 'imageID' in Swift.
    enum CodingKeys: String, CodingKey {
        case imageID = "image_id"
        case url
    }
    
    // MARK: Computed property to convert the URL string to a 'URL' object.
    // MARK: Because SwiftUI can't accept URL string for AsyncImage 🤷‍♂️
    var imageURL: URL? {
        if let urlString = url {
            return URL(string: urlString)
        }
        return nil
    }
}
