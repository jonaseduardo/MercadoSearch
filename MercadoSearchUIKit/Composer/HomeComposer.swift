//
//  HomeComposer.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

final class HomeComposer {
    static func createHomeViewController() -> HomeViewController {
        let searchViewModel = SearchViewModel()
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
