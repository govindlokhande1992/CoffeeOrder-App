//
//  OrderDetailViewController.swift
//  CoffeOrder
//
//  Created by Govind Lokhande on 2018-01-25.
//  Copyright © 2018 Govind Lokhande. All rights reserved.
//

import UIKit
import CoreData

class OrderDetailViewController: UIViewController {
    @IBOutlet weak var coffeeName: UILabel!
    
    let csView = CSView()
    let csModel = CSDrinkModel()
    var orderData:[Any] = [Any]()
    
    @IBOutlet weak var cofeeSize: UILabel!
    @IBOutlet weak var CofeeType: UILabel!
    @IBOutlet weak var coffeeshots: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
