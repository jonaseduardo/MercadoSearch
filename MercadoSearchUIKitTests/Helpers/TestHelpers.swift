//
//  TestHelpers.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 20/02/2024.
//

import Foundation
import MercadoSearchUIKit

func makeItemsJSON(_ items: [[String: Any]]) -> Data {
    let json = ["results": items]
    return try! JSONSerialization.data(withJSONObject: json)
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func searchItem1() -> SearchItem {
    SearchItem(name: "TV",
               condition: "Nuevo",
               quantity: 1,
               price: 100.0)
}

func searchItem2() -> SearchItem {
    SearchItem(name: "Bicicleta",
               condition: "Usada",
               quantity: 1,
               price: 200.0)
}
extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}
