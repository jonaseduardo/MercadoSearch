//
//  SearchViewModelTests.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 20/02/2024.
//

import XCTest
import Combine
@testable import MercadoSearchUIKit

final class SearchViewModelTests: XCTestCase {
    
    func test_searchItem_deliversSearchItemsOnSucceedsResponse() {
        let searchItems = [searchItem1(), searchItem2()]
        let result: Result<[SearchItem], Error> = .success(searchItems)
        
        let viewModel = makeSUT(with: result)
        
        var receivedItems: [SearchItem]?
        viewModel.onReceiveItems = {
            receivedItems = $0
        }
        
        viewModel.searchItem(searchText: "any text")
        
        let expectation = expectation(description: "Retrieve Search Items")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        
        XCTAssertEqual(receivedItems, searchItems)
    }
    
    func test_searchItem_deliversErrorOnFailsResponse() {
        let viewModel = makeSUT(with: .failure(anyNSError()))
        
        var receivedError: SearchError?
        viewModel.onReceiveError = {
            receivedError = $0
        }
        
        viewModel.searchItem(searchText: "any text")
        
        let expectation = expectation(description: "Get error to retrieve Search Items")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        
        XCTAssertEqual(receivedError, SearchError.itemsSearchFailed)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(with result: Result<[SearchItem], Error> = .success([])) -> SearchViewModel {
        let publisher = Deferred {
            Future { completion in
                completion(result)
            }
        }.eraseToAnyPublisher()
        let viewModel = SearchViewModel { _ in
            publisher
        }
        
        return viewModel
    }
}
