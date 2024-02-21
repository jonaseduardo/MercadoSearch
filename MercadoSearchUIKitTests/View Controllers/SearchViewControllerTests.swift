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
        
        let searchViewController = makeSUT()
        searchViewController.loadViewIfNeeded()
        
        searchViewController.setSearchItems([searchItem1, searchItem2])
                
        XCTAssertEqual(searchViewController.numberOfRows(), 2)
        XCTAssertEqual(searchViewController.searchName(at: 0), searchItem1.name)
        XCTAssertEqual(searchViewController.searchName(at: 1), searchItem2.name)
    }
    
    func test_setSearchItems_showCollectionView() {
        let searchItem = searchItem1()
        
        let searchViewController = makeSUT()
        searchViewController.loadViewIfNeeded()
        
        searchViewController.setSearchItems([searchItem])
        
        XCTAssertEqual(searchViewController.collectionViewIsVisible, true)
        XCTAssertEqual(searchViewController.errorViewIsVisible, false)
    }
        
    func test_setError_DisplayErrorMessage() {
        let error: SearchError = .itemsSearchFailed
        
        let searchViewController = makeSUT()
        searchViewController.loadViewIfNeeded()
        
        searchViewController.setError(error: error)
        
        XCTAssertEqual(searchViewController.errorMessage, error.message)
    }
    
    func test_setError_showErrorView() {
        let searchViewController = HomeUIComposer.createSearchViewController()
        searchViewController.loadViewIfNeeded()
    
        searchViewController.setError(error: .itemsSearchFailed)
        
        XCTAssertEqual(searchViewController.errorViewIsVisible, true)
        XCTAssertEqual(searchViewController.collectionViewIsVisible, false)
    }
    
    func test_tapOnRow_selectSearchItem() {
        let searchItem = searchItem1()
        let delegate = SearchResultDelegateSpy()
        
        let searchViewController = makeSUT()
        searchViewController.delegate = delegate
        searchViewController.loadViewIfNeeded()
        
        searchViewController.setSearchItems([searchItem])
        searchViewController.simulateTapOnSearchItem(at: 0)
        
        XCTAssertEqual(delegate.selectedSearchItem, searchItem)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> SearchViewController {
        let searchViewController = HomeUIComposer.createSearchViewController()
        trackForMemoryLeaks(searchViewController)
        
        return searchViewController
    }
}
