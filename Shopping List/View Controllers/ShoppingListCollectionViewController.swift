//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Akmal Nurmatov on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit



class ShoppingListCollectionViewController: UICollectionViewController {
    func showCheckoutAlert() {
        <#code#>
    }
    

    let shoppingItemController = ShoppingItemController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceOrder" {
            guard let placeOrderVC = segue.destination as? PlaceOrderViewController else { return }
            placeOrderVC.shoppingItemController = shoppingItemController 
        }
    }
    

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingListItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell()}
        
        let shoppingItem = shoppingItemController.shoppingListItems[indexPath.row]
        
        cell.shoppingItem = shoppingItem 
    
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShoppingItemCollectionViewCell else {return}
        
        var shoppingListItem = shoppingItemController.shoppingListItems[indexPath.item]
        
        shoppingListItem.hasBeenSelected.toggle()
        cell.shoppingItem?.hasBeenSelected.toggle()
        
        cell.updateSelectedLabel()
    }

}
