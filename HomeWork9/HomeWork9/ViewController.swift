//
//  ViewController.swift
//  HomeWork9
//
//  Created by Pavel Procenko on 06/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController

{
    
    @IBOutlet weak var typeOfCoffee: UISegmentedControl!
    
    @IBOutlet weak var sizeSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var sugarSlider: UISlider!
    
    @IBOutlet weak var ownCupSlider: UISwitch!
    
    
    @IBOutlet weak var makeCoffeeButton: UIButton!
    
    
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        maxValueLabel.text = "\(Int(sugarSlider.maximumValue))"
        
        minValueLabel.text = "\(Int(sugarSlider.minimumValue))"
        
        currentValueLabel.text = "\(Int(sugarSlider.value))"
        
        

    }
   
    
    @IBAction func valueChangedSlider(_ sender: Any) {
   
        currentValueLabel.text = "\(Int(sugarSlider.value))"
    }
    
    
    @IBAction func makeCoffeeButton(_ sender: Any) {
      
        let order = Order(typeOfCoffee: typeOfCoffee.selectedSegmentIndex, size: sizeSegmentControl.selectedSegmentIndex, sugar: Int(sugarSlider.value), switchState: ownCupSlider.isOn)
        
        let price = getPriceOfCoffee(order: order)
        
        getAlert(order: order, price: price)
        
        

    }
    
    private func getPriceOfCoffee(order: Order) -> Double {
        
        var price: Double = 0
        
        switch (order.typeOfCoffee, order.size, order.sugar, order.switchState) {
            
        case (0,0,_,false):
            
            price += 4
            
        case (0,1,_,false):
            
            price += 6
            
        case (0,2,_,false):
            
            price += 7.5
            
        case (1...2,0,_,false):
            
            price += 2
            
        case (1...2,1,_,false):
            
            price += 3
            
        case (1...2,2,_,false):
            
            price += 3.7
            
        case (0,0,_,true):
            
            price += 3
            
        case (0,1,_,true):
            
            price += 5

        case (0,2,_,true):
            
            price += 6.5

        case (1...2,0,_,true):
            
            price += 1.5
            
        case (1...2,1,_,true):
            
            price += 2.2
            
        case (1...2,2,_,true):
            
            price += 3.1
            
            
        default:
            
            print("Такого я не ожидал")
            
        }
        
       return price
    }
    
    private func getAlert(order: Order, price: Double)  {
        
        
        let alertController = UIAlertController(
            title: "Счёт ",
            message: "Кофе будет стоить \(price). Вы уверены?",
            preferredStyle: .alert
        )
        let yes = UIAlertAction(title: "Да", style: .default) { _ in
            print("TypeOfCoffee: \(self.typeOfCoffee.titleForSegment(at: order.typeOfCoffee)!), size: \(self.sizeSegmentControl.titleForSegment(at: order.size)!) , Sugar: \(order.sugar) mg, MyOwnCup: \(order.switchState)")
            
            
            
        
            

        }
        let no = UIAlertAction(title: "Нет", style: .cancel) { _ in
            print("Cancel")
            
        }
        
        alertController.addAction(yes)
        alertController.addAction(no)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

}

