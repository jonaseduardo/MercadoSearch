//
//  SearchItemsMapperTests.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 20/02/2024.
//

import XCTest
import MercadoSearchUIKit

final class SearchItemsMapperTests: XCTestCase {
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let json = makeItemsJSON([])
        let codes = [199, 201, 300, 400, 500]
        
        try codes.forEach { code in
            try XCTAssertThrowsError(SearchItemsMapper.map(json, from: HTTPURLResponse(statusCode: code)))
        }
    }
    
    func test_map_throwsErrorOn200HTTPResponseWithInvalidJSON() {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try SearchItemsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func test_map_deliversEmptySearchItemsOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeItemsJSON([])

        let result = try SearchItemsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: 200))

        XCTAssertEqual(result, [])
    }
    
    func test_map_deliversSearchItemsOn200HTTPResponseWithJSONItems() throws {
        let searchItem1 = makeSearchItem(name: "Celular",
                                         condition: "Nuevo",
                                         quantity: "1",
                                         price: "2000")
        
        let searchItem2 = makeSearchItem(name: "Bicicleta",
                                         condition: "Usada",
                                         quantity: "1",
                                         price: "1500")
        
        let expectedSearchItems = [searchItem1.model, searchItem2.model]
        let json = makeItemsJSON([searchItem1.json, searchItem2.json])
        
        let result = try SearchItemsMapper.map(json, from: HTTPURLResponse(statusCode: 200))

        XCTAssertEqual(result, expectedSearchItems)
    }
    
    // MARK: - Helpers
    
    private func makeSearchItem(name: String,
                               condition: String,
                               quantity: String,
                               price: String) -> (model: SearchItem, json: [String: Any]) {
        
        let searchItem = SearchItem(name: name,
                                    condition: condition,
                                    quantity: quantity,
                                    price: price)
        let json: [String : Any] = [
            "title": name,
            "condition": condition,
            "available_quantity": Int(quantity)!,
            "price": Int(price)!
        ]
        
        return (searchItem, json)
    }
}
