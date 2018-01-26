//
//  CSDrink.swift
//  CofeeOrder-MVC
//
//  Created by Govind Lokhande on 3/20/17.
//  Copyright © 2017 Govind . All rights reserved.
//

import Foundation
import UIKit

import CoreData

enum drinkName : String {
    
    case drinkNameLatte = "Latte"
    case drinkNameAmerican = "Americano"
    case drinkNameEspresso = "Espresso"
}

enum drinkSize : Int {
    
    case drinkSizeSmall = 0
    case drinkSizeMedium
    case drinkSizeGrande
}

enum icedOrHotType : Int {
    case iced = 0
    case hot = 1
}

class CSDrinkModel {
    
    var numOfShots : Int = 0
    var isIced : Bool = true
    var name : drinkName = .drinkNameEspresso
    var size : drinkSize = .drinkSizeMedium
    var orderData:[Any] = [Any]()

    
    private var drinkisIcedType : String {
        
        return isIced ? "ICED" : "HOT"
    }
    
    private var drinkName : String {

        return name.rawValue
    }
    
    
    func setDrinkName(segmentIndex : Int) {
        
        switch  segmentIndex{
        case 0:
            self.name = .drinkNameLatte
        case 1:
            self.name = .drinkNameAmerican
        case 2:
            self.name = .drinkNameEspresso
        default :
            self.name = .drinkNameEspresso
        }
    }
    
    
    func setCofeeIceOrHotType(type : icedOrHotType) {
        
        switch type  {
        case .iced:
             isIced = true
        case .hot:
             isIced = false
        }
    }
    
    func setCofeeDrinkSize(dsize : drinkSize) {
        self.size = dsize
    }
    
    func prepareOrder(sucess: (Bool) -> ())  {
        //Order Prepared
        print("DrinkName:\(self.drinkName) , No.Shots: \(numOfShots) , isIced : \(isIced)) , size : \(String(describing: size))")
        let appdelgegate  = UIApplication.shared.delegate as! AppDelegate
        // 2
        let appcontext = appdelgegate.persistentContainer.viewContext
        let newOrder = NSEntityDescription.insertNewObject(forEntityName: "Order", into: appcontext) as! Order
        newOrder.setValue(self.drinkName, forKey: "coffeeName")
        newOrder.setValue(self.numOfShots, forKey: "shots")
        newOrder.setValue("\(self.size)", forKey: "coffeesize")
        newOrder.setValue(self.isIced, forKey: "isIced")
        do{
            try appcontext.save()
            sucess(true)
        }catch{
        }
    }
   func fetchOrderData()->[Any]{
       let appdelgegate  = UIApplication.shared.delegate as! AppDelegate
    // 2
       var result:[Any] = [Any]()
       let appcontext = appdelgegate.persistentContainer.viewContext
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    
    // Create Entity Description
    
       let entityDescription = NSEntityDescription.entity(forEntityName: "Order", in: appcontext)
    
    // Configure Fetch Request
      fetchRequest.entity = entityDescription
    
      do {
          result = try appcontext.fetch(fetchRequest)
          return result
       } catch {
        _ = error as NSError
       }
       return result
    }
}
