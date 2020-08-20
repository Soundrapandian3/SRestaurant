//
//  CartViewController.swift
//  Restaurant
//
//  Created by Soundrapandian T on 20/08/20.
//  Copyright © 2020 Soundrapandian T. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var lblitems: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order Details"
        lblitems.text =  RestaurantCartModel.sharedCart.itemString
        // Do any additional setup after loading the view.
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
