//
//  ProductModel.swift
//  MVVM Product API
//
//  Created by Md Khorshed Alam on 7/8/24.
//

import Foundation

// MARK: - ListRoomEntityElement
struct ProductModel: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating
    
    enum CodingKeys: String, CodingKey {
    case id
    case title
    case price
    case description
    case category
    case image 
    case rating
  }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
    
//    enum CodingKeys: String, CodingKey {
//        case rate
//        case count
  //  }
}
