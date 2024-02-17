//
//  DetailViewController.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    let viewModel: DetailViewModel
    
    init?(coder: NSCoder, viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a viewModel")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel.name
    }
}
