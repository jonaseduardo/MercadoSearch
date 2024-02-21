//
//  UITableView+Dequeueing.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 21/02/2024.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
