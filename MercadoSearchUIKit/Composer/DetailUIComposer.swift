//
//  DetailUIComposer.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

final class DetailUIComposer {
    static func createDetail(item: SearchItem) -> DetailViewController {
        let bundle = Bundle(for: DetailViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") { coder in
            DetailViewController(coder: coder, viewModel: DetailViewModel(searchItem: item))
        }
        return detailViewController
    }
}
