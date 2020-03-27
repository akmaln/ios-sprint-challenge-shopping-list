//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Akmal Nurmatov on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Encodable {
    var name: String
    var hasBeenSelected: Bool = false
    var image: UIImage
    
    init(name: String, imageName: String) {
        self.name = name
            
        self.image = UIImage(named: imageName)!
    }
    
}
