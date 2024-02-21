//
//  DetailViewController.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
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
        
        configViews()
    }
    
    private func configViews() {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        conditionLabel.text = viewModel.condition
        quantityLabel.text = viewModel.quantity
    }
}
