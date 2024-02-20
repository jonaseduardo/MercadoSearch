//
//  CombineHelpers.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 20/02/2024.
//

import Foundation
import Combine

public extension HTTPClient {
    typealias Publisher = AnyPublisher<(Data, HTTPURLResponse), Error>
    
    func getPublisher(url: URL) -> Publisher {
        return Deferred {
            Future { completion in
                self.get(from: url, completion: completion)
            }
        }
        .eraseToAnyPublisher()
    }
}
