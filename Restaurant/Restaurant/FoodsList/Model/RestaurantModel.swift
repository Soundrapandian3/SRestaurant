//
//  RestaurantModel.swift
//  Restaurant
//
//  Created by Soundrapandian T on 19/08/20.
//  Copyright © 2020 Soundrapandian T. All rights reserved.
//

import Foundation
enum FoodType : String
{
    case BreakFast,Lunch,Dessert,Juice
}

class FoodItem {
    var name : String!
    var price : String!
    var isPlaced : Bool = false
    var count : Int = 0
    init() {
    }
    init(fname : String,fprice : String) {
        name = fname
        price = fprice
    }
}

class Foods {
    var foodType : FoodType
    var foodItems = [FoodItem]()
    init(fType : FoodType) {
        foodType = fType
    }
    func createBreakFast()
    {
        let idly = FoodItem(fname: "Idly", fprice: "10")
        let dosa = FoodItem(fname: "Dosa", fprice: "20")
        let poori = FoodItem(fname: "Poori", fprice: "10")
        let vada = FoodItem(fname: "Vada", fprice: "10")
        let pongal = FoodItem(fname: "Pongal", fprice: "10")
        foodItems.append(idly)
        foodItems.append(dosa)
        foodItems.append(poori)
        foodItems.append(vada)
        foodItems.append(pongal)
    }
    func createLunch()
    {
        let miniMeals = FoodItem(fname: "Mini Meals", fprice: "25")
        let fullMeals = FoodItem(fname: "Full Meals", fprice: "50")
        let tRice = FoodItem(fname: "Tomato Rice", fprice: "25")
        let cRice = FoodItem(fname: "Curd Rice", fprice: "25")
        foodItems.append(miniMeals)
        foodItems.append(fullMeals)
        foodItems.append(tRice)
        foodItems.append(cRice)
    }
    func createDessert()
       {
           let faluda = FoodItem(fname: "Faluda", fprice: "50")
           let vennila = FoodItem(fname: "Vennila with roasted nuts", fprice: "40")
           let brownie = FoodItem(fname: "Hot Sizzling Browne", fprice: "60")
           foodItems.append(faluda)
           foodItems.append(vennila)
           foodItems.append(brownie)
       }
    func createJuice()
    {
        let apple = FoodItem(fname: "Apple", fprice: "40")
        let orange = FoodItem(fname: "Orange", fprice: "30")
        let pomegranate = FoodItem(fname: "Pomegranate", fprice: "50")
         let butterFruit = FoodItem(fname: "Butter fruit", fprice: "50")
        foodItems.append(apple)
        foodItems.append(orange)
        foodItems.append(pomegranate)
        foodItems.append(butterFruit)
    }
}
