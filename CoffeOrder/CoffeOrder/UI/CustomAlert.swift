//
//  CustomAlert.swift
//  ModalView
//
//  Created by Govind Lokhande on 3/20/17.
//  Copyright © 2017 Govind. All rights reserved.
//

import UIKit
import CoreData


class CustomAlert: UIView, Modal {
    var backgroundView = UIView()
    var dialogView = UIView()
    var customFont = UIFont(name: "Verdana", size: 16)
    
    
    convenience init(title:String,image:UIImage,orderdata:[Any]) {
        self.init(frame: UIScreen.main.bounds)
        print(orderdata)
        initialize(title: title, image: image,orderdata: orderdata)
        
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialize(title:String, image:UIImage,orderdata:[Any]){
        dialogView.clipsToBounds = true
        let order = orderdata[orderdata.count-1] as! NSManagedObject
        var cofeeName:String = String()
        var cofeeType:String = String()
        var cofeeShots:String = String()
        var cofeesize:String = String()


        
        if let _ = order.value(forKey: "coffeeName"), let _ = order.value(forKey: "coffeesize"),let _ = order.value(forKey: "isIced"),let _ = order.value(forKey: "shots") {
            cofeeName = order.value(forKey: "coffeeName") as! String
            cofeesize = order.value(forKey: "coffeesize") as! String
            if(order.value(forKey: "isIced") as! Bool ){
                cofeeType = "Hot Coffee"//"\(String(describing: order.value(forKey: "isIced")!)) iced Coffee"
            }else{
                cofeeType = "iCed Coffee"
            }
            cofeeShots = "\(String(describing: order.value(forKey: "shots")!)) shots Coffee"
        }
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        
        let dialogViewWidth = frame.width-64
        
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: dialogViewWidth-16, height: 30))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Verdana", size: 20)
        titleLabel.textColor = UIColor.orange
        dialogView.addSubview(titleLabel)

        
        let separatorLineView = UIView()
        separatorLineView.frame.origin = CGPoint(x: 0, y: titleLabel.frame.height + 8)
        separatorLineView.frame.size = CGSize(width: dialogViewWidth, height: 1)
        separatorLineView.backgroundColor = UIColor.groupTableViewBackground
        dialogView.addSubview(separatorLineView)
        
        
        let imageView = UIImageView()
        imageView.frame.origin = CGPoint(x: 8, y: separatorLineView.frame.height + separatorLineView.frame.origin.y + 8)
        imageView.frame.size = CGSize(width: dialogViewWidth - 16 , height: dialogViewWidth - 50)
        imageView.image = image
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        dialogView.addSubview(imageView)
        
        let orderDetailView = UIView()
        orderDetailView.frame.origin = CGPoint(x: 8, y: imageView.frame.height + imageView.frame.origin.y + 8)
        orderDetailView.frame.size = CGSize(width: dialogViewWidth - 16 , height: dialogViewWidth - 50)
        orderDetailView.layer.cornerRadius = 4
        orderDetailView.clipsToBounds = true
        
        let orderTitleLabel = UILabel(frame: CGRect(x: 8, y: 8, width:orderDetailView.frame.size.width-10 , height: 30))
        orderTitleLabel.text = "Your order details"
        orderTitleLabel.textColor = UIColor.orange
        orderTitleLabel.textAlignment = .center
        orderTitleLabel.font = UIFont(name: "Verdana", size: 20)

        orderDetailView.addSubview(orderTitleLabel)
        
        let SeparatorLineView = UIView()
        SeparatorLineView.frame.origin = CGPoint(x: 0, y: orderTitleLabel.frame.origin.y + orderTitleLabel.frame.size.height + 8)
        SeparatorLineView.frame.size = CGSize(width: dialogViewWidth, height: 2)
        SeparatorLineView.backgroundColor = UIColor.orange
        
        
        orderDetailView.addSubview(SeparatorLineView)
        
        let cofeenameLabel = UILabel(frame: CGRect(x: 8, y: orderTitleLabel.frame.origin.y + orderTitleLabel.frame.size.height + 30, width:orderDetailView.frame.size.width-10 , height: 30))
        cofeenameLabel.text = cofeeName
        cofeenameLabel.font = customFont
        cofeenameLabel.textAlignment = .center
        orderDetailView.addSubview(cofeenameLabel)
        
        let coffeeTypelable = UILabel(frame: CGRect(x: 8, y: cofeenameLabel.frame.origin.y + cofeenameLabel.frame.size.height + 10, width:orderDetailView.frame.size.width-10 , height: 30))
        coffeeTypelable.text = cofeeType
        coffeeTypelable.font = customFont

        coffeeTypelable.textAlignment = .center
        orderDetailView.addSubview(coffeeTypelable)
        
        let cofeeSizeLabel = UILabel(frame: CGRect(x: 8, y: coffeeTypelable.frame.origin.y + coffeeTypelable.frame.size.height + 10, width:orderDetailView.frame.size.width-10 , height: 30))
        cofeeSizeLabel.text = cofeesize
        cofeeSizeLabel.textAlignment = .center
        cofeeSizeLabel.font = customFont

        orderDetailView.addSubview(cofeeSizeLabel)
        
        let cofeeShotsLabel = UILabel(frame: CGRect(x: 8, y: cofeeSizeLabel.frame.origin.y + cofeeSizeLabel.frame.size.height + 10, width:orderDetailView.frame.size.width-10 , height: 30))
        cofeeShotsLabel.text = cofeeShots
        cofeeShotsLabel.textAlignment = .center
        cofeeShotsLabel.font = customFont

        orderDetailView.addSubview(cofeeShotsLabel)
        
        dialogView.addSubview(titleLabel)
        dialogView.addSubview(imageView)
        dialogView.addSubview(orderDetailView)
        
        let dialogViewHeight = titleLabel.frame.height + 8 + separatorLineView.frame.height + 8 + imageView.frame.height + orderDetailView.frame.height + 8
        
        dialogView.frame.origin = CGPoint(x: 32, y: frame.height)
        dialogView.frame.size = CGSize(width: frame.width-64, height: dialogViewHeight)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }
    
}
