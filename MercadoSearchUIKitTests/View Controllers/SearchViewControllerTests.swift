//
//  SearchViewControllerTests.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 20/02/2024.
//

import XCTest
@testable import MercadoSearchUIKit

final class SearchViewControllerTests: XCTestCase {
    
    func test_setSearchItems_DisplayItemsOnView() {
        let searchItem1 = searchItem1()
        let searchItem2 = searchItem2()
        
        let searchViewController = HomeUIComposer.createSearchViewController()
        
        searchViewController.setSearchItems([searchItem1, searchItem2])
        
        XCTAssertEqual(searchViewController.numberOfRows(), 2)
        XCTAssertEqual(searchViewController.searchName(at: 0), searchItem1.name)
        XCTAssertEqual(searchViewController.searchName(at: 1), searchItem2.name)
    }
    
    func test_tapOnRow_selectSearchItem() {
        let searchItem = searchItem1()
        let delegate = SearchResultDelegateSpy()
        
        let searchViewController = HomeUIComposer.createSearchViewController()
        searchViewController.delegate = delegate
        
        searchViewController.setSearchItems([searchItem])
        searchViewController.simulateTapOnSearchItem(at: 0)
        
        XCTAssertEqual(delegate.selectedSearchItem, searchItem)
    }
}
