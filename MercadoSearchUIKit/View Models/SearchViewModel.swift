//
//  SearchViewModel.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import Foundation
import Combine

class SearchViewModel {
    typealias SearchPublisher = (String) -> AnyPublisher<[SearchItem], Error>
    typealias ReceiveItems = ([SearchItem]) -> Void
    
    var onReceiveItems: ReceiveItems?
    
    private var cancellable: Cancellable?
    private let publisher: SearchPublisher
    
    init(publisher: @escaping SearchPublisher) {
        self.publisher = publisher
    }
    
    func searchItem(searchText: String) {
        cancellable = publisher(searchText)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                
            switch result {
            case .finished:
                break
            case let .failure(error):
                break
            }
            
        }, receiveValue: { [weak self] searchItems in
            self?.onReceiveItems?(searchItems)
        })
    }
}
