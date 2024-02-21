//
//  HomeUIComposer.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

final class HomeUIComposer {
    static func createHome() -> HomeViewController {
        let searchViewModel =  SearchViewModel { query in
            let publisher = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
                .getPublisher(url: SearchItemsEndpoint.get.url(baseURL: Environment.baseUrl, query: query))
                .tryMap(SearchItemsMapper.map)
                .eraseToAnyPublisher()
            return publisher
        }
        
        let searchViewController = createSearchViewController()
        
        let bundle = Bundle(for: HomeViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let controller = storyboard.instantiateViewController(identifier: "HomeViewController") { coder in
            HomeViewController(coder: coder,
                               viewModel: searchViewModel,
                               searchViewController: searchViewController)
        }
        return controller
    }
    
    static func createSearchViewController() -> SearchViewController {
        let bundle = Bundle(for: SearchViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let controller = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        return controller
    }
}
