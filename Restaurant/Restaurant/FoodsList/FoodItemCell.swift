//
//  FoodItemCell.swift
//  Restaurant
//
//  Created by Soundrapandian T on 19/08/20.
//  Copyright © 2020 Soundrapandian T. All rights reserved.
//

import UIKit
//protocol RowDelegate : class {
//    func btnAddCart(sender : UIButton)
//    func itemIncrement(sender : UIStepper)
//}

class FoodItemCell: UITableViewCell {
    
    static let cellIdentifier = "FoodItemCell"

    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnAddCart: UIButton!
    
    @IBOutlet weak var stepper: UIStepper!
        
    @IBOutlet weak var lblCount: UILabel!
    
    
    
   // weak var delegate : RowDelegate?
    var data = FoodItem()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stepper.minimumValue = 0
        lblCount.isHidden = true
        stepper.isHidden = true
    }

    @IBAction func btnAddCartAction(_ sender: Any) {
      //  delegate?.btnAddCart(sender: sender as! UIButton)
        data.isPlaced = true
       // data.count += 1
        
        lblCount.isHidden = false
        stepper.isHidden = false
        btnAddCart.isHidden = true
        
        //lblCount.text = "\(data.count+1)"
        
        RestaurantCartModel.sharedCart.items.append(data)
        for item in RestaurantCartModel.sharedCart.items
        {
            if data === item
            {
                item.count += 1
                lblCount.text = "\(item.count)"//= data.count
                stepper.value = Double(item.count)
            }
        }
    }
    @IBAction func stepperAction(_ sender: Any) {
        //data.count = Int((sender as! UIStepper).value)
        //lblCount.text = "\(data.count)"
        for (index,item) in RestaurantCartModel.sharedCart.items.enumerated()
        {
            if data === item
            {
                item.count = Int((sender as! UIStepper).value)
                lblCount.text = "\(item.count)"//= data.count
                
                if Int((sender as! UIStepper).value) == 0
                {
                    data.isPlaced = false
                    
                    lblCount.isHidden = true
                    stepper.isHidden = true
                    btnAddCart.isHidden = false
                    RestaurantCartModel.sharedCart.items.remove(at:index)
                }
                
            }
        }
        
      //  delegate?.itemIncrement(sender: sender as! UIStepper)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
