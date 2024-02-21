//
//  HomeCoordinator.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

final class HomeCoordinator: Coordinator {
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
        let detailViewController = DetailUIComposer.createDetail(item: item)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
