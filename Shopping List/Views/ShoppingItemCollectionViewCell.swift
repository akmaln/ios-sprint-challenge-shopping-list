//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Akmal Nurmatov on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else {return}
        
        imageView.image = shoppingItem.image
        itemNameLabel.text = shoppingItem.name
        addRemoveLabel.text = "Not Added"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var addRemoveLabel: UILabel!
    
    func updateSelectedLabel() {
        guard let shoppingItem = shoppingItem else { return }
        if shoppingItem.hasBeenSelected {
            addRemoveLabel.text = "Added"
        } else {
            addRemoveLabel.text = "Not Added" 
        }
    }
}
