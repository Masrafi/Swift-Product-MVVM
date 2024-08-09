//
//  WebServices.swift
//  MVVM Product API
//
//  Created by Md Khorshed Alam on 7/8/24.
//

import Foundation

final class WebService {
    
    static func getUsersData() async throws -> [ProductModel] {
        let urlString = "https://fakestoreapi.com/products/"
        guard let url = URL(string: urlString) else {
            throw UserError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        do {
            print("Store dada in model")
            print("Store dada in model")
            let decoder = JSONDecoder()
            return try decoder.decode([ProductModel].self, from: data)
        } catch {
            throw UserError.invalidData
        }
    }
}
