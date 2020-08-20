//
//  ViewController.swift
//  Restaurant
//
//  Created by Soundrapandian T on 19/08/20.
//  Copyright © 2020 Soundrapandian T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = [Foods]()
    
    @IBOutlet weak var tblItems: UITableView!
    @IBOutlet weak var btnPlaceOrder: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Foods"
        creatingModels()
        tblItems.dataSource = self
        tblItems.delegate = self
        tblItems.reloadData()
        
    }
    @IBAction func placeOrderAction(_ sender: Any) {
        if RestaurantCartModel.sharedCart.items.count == 0
        {
            showAlert(message: "Select any order before proceed.")
        }
        else
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let cartVC = storyBoard.instantiateViewController(identifier: "Cart") as! CartViewController
            navigationController?.pushViewController(cartVC, animated: true)
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        
        if RestaurantCartModel.sharedCart.items.count == 0
        {
            showAlert(message: "Please seleted order.")
        }
        else
        {
            RestaurantCartModel.sharedCart.items.removeAll()
            model.removeAll()
            showAlert(message: "Reset Successfully")
            creatingModels()
            tblItems.reloadData()
        }
    }
}
extension ViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].foodItems.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  model[section].foodType.rawValue
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodItemCell.cellIdentifier) as? FoodItemCell ?? FoodItemCell()
        cell.lblItemName.text = model[indexPath.section].foodItems[indexPath.row].name
        cell.lblPrice.text = model[indexPath.section].foodItems[indexPath.row].price
        let data = model[indexPath.section].foodItems[indexPath.row]
        cell.data = data
        if data.isPlaced
        {
            cell.lblCount.isHidden = false
            cell.stepper.isHidden = false
            cell.btnAddCart.isHidden = true
            for item in RestaurantCartModel.sharedCart.items
            {
                if data === item
                {
                    cell.lblCount.text = "\(item.count)"//= data.count
                    //cell.stepper.value = Double(item.count)
                }
            }
            //cell.lblCount.text = "\(data.count)"
        }
        else
        {
            cell.lblCount.isHidden = true
            cell.stepper.isHidden = true
            cell.btnAddCart.isHidden = false
           //r cell.stepper.value = Double(data.count)
        }
//        cell.btnAddCart.tag = indexPath.row + 1000
//        cell.stepper.tag = indexPath.row + 2000
       // cell.delegate = self
        return cell
    }
    
    
}
//extension ViewController : RowDelegate
//{
//    func btnAddCart(sender: UIButton) {
//        //let row = sender.tag - 1000
//       let indexPath = tblItems.indexPath(for: sender)
//    }
//
//    func itemIncrement(sender: UIStepper) {
//       let indexPath = tblItems.indexPath(for: sender)
//    }
//
//
//}
extension ViewController
{
    func creatingModels()
    {
        let breakFastFood = Foods(fType: .BreakFast)
        breakFastFood.createBreakFast()
        model.append(breakFastFood)
        let lunch = Foods(fType: .Lunch)
        lunch.createLunch()
        model.append(lunch)
        let dessert = Foods(fType: .Dessert)
        dessert.createDessert()
        model.append(dessert)
        let juice = Foods(fType: .Juice)
        juice.createJuice()
        model.append(juice)
    }
}
extension ViewController
{
    func showAlert(message : String)
    {
        let alert = UIAlertController.init(title: "Restaurant", message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
}
