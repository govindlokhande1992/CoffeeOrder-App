//
//  ViewController.swift
//  Coffee Order-MVC
//
//  Created by Govind okhande on 3/20/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.


import UIKit
import CoreData

class ViewController: UIViewController {
    
    let csView = CSView()
    let csModel = CSDrinkModel()
    var orderData:[Any] = [Any]()

    //let csDrink = CSDrink()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addCofeeShopView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCofeeShopView() {
        let boxSize: CGFloat = view.bounds.width
        csView.frame = CGRect(x: 0,y: 0,
                              width: boxSize,
                              height: view.bounds.height)
        csView.parentFrame = view.frame
        csView.delegate = self
        view.addSubview(csView)
        
    }
    
}

extension ViewController : CSViewProtocol {
    
    func cofeeNameUpdate(_ segmentIndex: Int) {
        self.csModel.setDrinkName(segmentIndex: segmentIndex)
    }
    
    func cofeeShotsUpdateWithCurrent(_ value: Int) {
        csModel.numOfShots = value
    }
    
    func cofeeHotIceTypeUpdate(_ segmentIndex: Int) {
        csModel.setCofeeIceOrHotType(type: icedOrHotType(rawValue: segmentIndex)!)
    }
    
    func cofeeSizeUpdate(_ segmentIndex: Int) {
        csModel.setCofeeDrinkSize(dsize: drinkSize(rawValue: segmentIndex)!)
    }
    //
    func confirmOrderButtonTapped() {
        csModel.prepareOrder() {
            (response) in
            if response == true {
                //Succss
                //csView.resetData()
                orderData =  csModel.fetchOrderData()
                if(orderData.count > 0){
                        let alert = CustomAlert(title: "Your Order is Ready 👋🏻👋🏻", image: #imageLiteral(resourceName: "Coffee"),orderdata: orderData)
                        alert.show(animated: true)
                        //Succs
                    }
            }
        }
    }
}


