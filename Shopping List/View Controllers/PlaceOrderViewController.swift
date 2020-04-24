//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Akmal Nurmatov on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit




class PlaceOrderViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?
 
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    @IBAction func sendOrderButton(_ sender: Any) {
        guard let name = nameTextField.text, let adress = addressTextField.text else { return }
        checkoutAlert(name: name, address: adress)
    }
    
    func checkoutAlert(name: String, address: String) {
        if name == nameTextField.text && address == addressTextField.text{
            let alert = UIAlertController(title: "Order Placed!", message: "\(name), your order is on its way to \(address)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        descriptionLabel.text = "You have \(shoppingItemController.shoppingListItems.filter{ item in item.hasBeenSelected }.count) items in your cart."
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
