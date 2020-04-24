//
//  ItemController.swift
//  Shopping List
//
//  Created by Akmal Nurmatov on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static var shoppingListKey = "shoppingListKey" 
}

class ShoppingItemController {
    
    var shoppingListItems: [ShoppingItem] = [ShoppingItem(name: "Apple"),
                                             ShoppingItem(name: "Grapes"),
                                             ShoppingItem(name: "Milk"),
                                             ShoppingItem(name: "Muffin"),
                                             ShoppingItem(name: "Popcorn"),
                                             ShoppingItem(name: "Soda"),
                                             ShoppingItem(name: "Strawberries")]
    
    init() {
       loadFromPresistentStore()
        
        }
    
    var shoppingListInitialized: Bool {
        get {
            UserDefaults.standard.bool(forKey: .shoppingListKey)
        } set {
            UserDefaults.standard.set(newValue, forKey: .shoppingListKey)
        }
    }
    
    
    var shoppingListURl: URL? {
        let fileManager = FileManager.default
        let documentDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let shoppingListURL = documentDir?.appendingPathComponent("shoppingList.plist")
        return shoppingListURL
    }
    
    func saveToPersistenStore() {
        let encoder = PropertyListEncoder()
        
        do{
            let shoppingListData = try encoder.encode(shoppingListItems)
            guard let shoppingListURL = shoppingListURl else { return }
            try shoppingListData.write(to: shoppingListURL)
        } catch {
            print("Unable to save shopping list to plist \(error)")
        }
    }
    
    func loadFromPresistentStore() {
        let decoder = PropertyListDecoder()
        
        do {
            guard let shoppingListURL = shoppingListURl else { return }
            let shoppingListData = try Data(contentsOf: shoppingListURL)
            let decodedShoppingList = try decoder.decode([ShoppingItem].self, from: shoppingListData)
            self.shoppingListItems = decodedShoppingList
        } catch {
            print("Unable to open shopping list plist: \(error)")
        }
    } 
    
}

