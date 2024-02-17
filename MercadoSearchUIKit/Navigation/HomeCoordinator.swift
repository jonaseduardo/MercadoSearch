//
//  HomeCoordinator.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeUIComposer.createHome()
        homeViewController.navigateToDetail = navigateToDetail
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func navigateToDetail(item: SearchItem) {
        let bundle = Bundle(for: DetailViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") { coder in
            DetailViewController(coder: coder, viewModel: item)
        }
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
