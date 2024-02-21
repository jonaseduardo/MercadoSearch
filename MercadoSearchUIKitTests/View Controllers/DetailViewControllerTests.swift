//
//  DetailViewControllerTests.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 21/02/2024.
//

import XCTest
@testable import MercadoSearchUIKit

final class DetailViewControllerTests: XCTestCase {
    
    func test_detailData_displaysCorrectly() {
        let searchItem = searchItem1()
        let detailViewModel = DetailViewModel(searchItem: searchItem)
        
        let detailViewController = DetailUIComposer.createDetail(item: searchItem)
        detailViewController.loadViewIfNeeded()
        
        XCTAssertEqual(detailViewController.name, detailViewModel.name)
        XCTAssertEqual(detailViewController.price, detailViewModel.price)
        XCTAssertEqual(detailViewController.condition, detailViewModel.condition)
        XCTAssertEqual(detailViewController.quantity, detailViewModel.quantity)
    }
}
