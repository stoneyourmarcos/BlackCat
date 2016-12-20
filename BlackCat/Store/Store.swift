//
//  Store.swift
//  BlackCat
//
//  Created by Marcos Contente on 19/12/16.
//  Copyright © 2016 Marcos Contente. All rights reserved.
//

import Foundation

class Store {
    
    static let shared = Store()
    
    func owner(owner: Repository) -> String {
        return owner.ownerLogin
    }
    
    func repository(repository: Repository) -> String {
        return repository.name
    }
}
