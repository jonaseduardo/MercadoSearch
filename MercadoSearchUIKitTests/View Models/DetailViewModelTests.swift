//
//  DetailViewModelTests.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 21/02/2024.
//

import XCTest
@testable import MercadoSearchUIKit

final class DetailViewModelTests: XCTestCase {
    
    func test_viewModel_displaysDataCorrectly() {
        let searchItem = searchItem1()
        let viewModel = DetailViewModel(searchItem: searchItem)
        
        XCTAssertEqual(viewModel.name, searchItem.name)
        XCTAssertEqual(viewModel.price, String(searchItem.price))
        XCTAssertEqual(viewModel.condition, searchItem.condition)
        XCTAssertEqual(viewModel.quantity, String(searchItem.quantity))
    }
}
