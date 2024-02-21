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
        let (detailViewController, detailViewModel) = makeSUT(item: searchItem)
        detailViewController.loadViewIfNeeded()
        
        XCTAssertEqual(detailViewController.name, detailViewModel.name)
        XCTAssertEqual(detailViewController.price, detailViewModel.price)
        XCTAssertEqual(detailViewController.condition, detailViewModel.condition)
        XCTAssertEqual(detailViewController.quantity, detailViewModel.quantity)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(item: SearchItem) -> (DetailViewController, DetailViewModel) {
        let detailViewModel = DetailViewModel(searchItem: item)
        let detailViewController = DetailUIComposer.createDetail(item: item)
        
        trackForMemoryLeaks(detailViewController)
        return (detailViewController, detailViewModel)
    }
}
