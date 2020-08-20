//
//  RestaurantCartModel.swift
//  Restaurant
//
//  Created by Soundrapandian T on 20/08/20.
//  Copyright © 2020 Soundrapandian T. All rights reserved.
//

import Foundation

class RestaurantCartModel
{
    static let sharedCart = RestaurantCartModel()
    var items : [FoodItem] = []
    
    var itemString : String {
        var totalCount = Int()
        var itemsString : [String] = items.map {
            item in
            let count = item.count * Int(item.price)!
            totalCount += count
            let str = item.name + "     " + String(item.count)+"x"+item.price + "   " + String(count)
            return str
        }
        let str = "Total  ="+String(totalCount)
        itemsString.append(str)
        return itemsString.joined(separator: "\n")
    }
}

