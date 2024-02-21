//
//  SearchResultDelegateSpy.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 21/02/2024.
//

@testable import MercadoSearchUIKit

final class SearchResultDelegateSpy: SearchResultDelegate {
    var selectedSearchItem: SearchItem?
    
    func didSelect(item: SearchItem) {
        selectedSearchItem = item
    }
}
