//
//  SearchItemsEndpointTests.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 21/02/2024.
//

import XCTest
@testable import MercadoSearchUIKit

final class SearchItemsEndpointTests: XCTestCase {
    
    func test_searchItems_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!
        let query = "cama"
        
        let receivedUrl = SearchItemsEndpoint.get.url(baseURL: baseURL, query: query)
        let expectedUrl = URL(string: "http://base-url.com/MLA/search?q=\(query)")!
        
        XCTAssertEqual(receivedUrl, expectedUrl)
    }
}
