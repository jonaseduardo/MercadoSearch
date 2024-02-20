//
//  SearchItemsMapper.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 20/02/2024.
//

import Foundation

public final class SearchItemsMapper {
    private struct Root: Decodable {
        private let results: [RemoteSearchItem]
        
        private struct RemoteSearchItem: Decodable {
            let title: String
            let condition: String
            let available_quantity: Int
            let price: Int
        }
        
        var searchItems: [SearchItem] {
            results.map {
                SearchItem(name: $0.title, 
                           condition: $0.condition,
                           quantity: String($0.available_quantity),
                           price: String($0.price))
            }
        }
    }
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [SearchItem] {
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw Error.invalidData
        }
        return root.searchItems
    }
}
