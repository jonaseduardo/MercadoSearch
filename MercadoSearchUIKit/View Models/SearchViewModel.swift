//
//  SearchViewModel.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import Foundation
import Combine

struct SearchError: Error, Equatable {
    let message: String
    
    static let itemsSearchFailed = SearchError(message: "No items found")
}

final class SearchViewModel {
    typealias SearchPublisher = (String) -> AnyPublisher<[SearchItem], Error>
    typealias ReceiveItems = ([SearchItem]) -> Void
    typealias ReceiveError = (SearchError) -> Void
    
    var onReceiveItems: ReceiveItems?
    var onReceiveError: ReceiveError?
    
    private var cancellable: Cancellable?
    private let publisher: SearchPublisher
        
    init(publisher: @escaping SearchPublisher) {
        self.publisher = publisher
    }
    
    func searchItem(searchText: String) {
        cancellable = publisher(searchText)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] result in
                
            switch result {
            case .finished:
                break
            case .failure:
                self?.onReceiveError?(.itemsSearchFailed)
            }
            
        }, receiveValue: { [weak self] searchItems in
            self?.onReceiveItems?(searchItems)
        })
    }
}
