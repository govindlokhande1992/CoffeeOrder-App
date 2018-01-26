//
//  CSView.swift
//  coffeeOrder-MVC
//
//  Created by Govind Lokhande on 3/20/17.
//  Copyright © 2017 Govind. All rights reserved.
//

import UIKit

protocol CSViewProtocol : class {
    
    func cofeeNameUpdate(_ segmentIndex:Int)
    func cofeeShotsUpdateWithCurrent(_ value:Int)
    func cofeeHotIceTypeUpdate(_ segmentIndex:Int)
    func cofeeSizeUpdate(_ segmentIndex:Int)

    func confirmOrderButtonTapped()
}

class CSView: UIView {

    //MARK: IBOutlet's declaration
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cofeeNameSegment: UISegmentedControl!
    @IBOutlet weak var shotsLabel: UILabel!
    @IBOutlet weak var shotsStepper: UIStepper!
    @IBOutlet weak var cofeeIceHotSegment: UISegmentedControl!
    @IBOutlet weak var cofeeSizeTypeSegment: UISegmentedControl!
    
    //Var:
    
    weak var delegate : CSViewProtocol?
    
    var parentFrame :CGRect = CGRect.zero
    
    //MARK:Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("CSView", owner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = self.bounds
       contentView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BackgroundImage"))

        contentView.autoresizingMask = [.flexibleHeight , .flexibleWidth]
        
        //Default Segment to Unselected
        resetData()
        
    }
    
    func resetData() {
        
        cofeeNameSegment.selectedSegmentIndex = -1
        cofeeIceHotSegment.selectedSegmentIndex = -1
        cofeeSizeTypeSegment.selectedSegmentIndex = -1
        shotsStepper.value = 0
        shotsLabel.text = "0 Shots"
    }
    
    
    @IBAction private func cofeeNameSegmentChanges(_ sender: UISegmentedControl) {
        
        print("Current Selection: \(sender.selectedSegmentIndex)")
        delegate?.cofeeNameUpdate(sender.selectedSegmentIndex)
        
    }

    @IBAction func shotsStepperValueChanges(_ sender: UIStepper) {
        
        shotsLabel.text = "\(Int(sender.value)) Shots"
        delegate?.cofeeShotsUpdateWithCurrent(Int(sender.value))
    }

    @IBAction func cofeeIceHotTypeChanges(_ sender: UISegmentedControl) {
         print("Current Selection: \(sender.selectedSegmentIndex)")
         delegate?.cofeeHotIceTypeUpdate(sender.selectedSegmentIndex)
    }
    
    @IBAction func cofeeSizeChanges(_ sender: UISegmentedControl) {
        delegate?.cofeeSizeUpdate(sender.selectedSegmentIndex)
    }
    
    
    @IBAction private func confirmAction(_ sender: UIButton) {
        self.delegate?.confirmOrderButtonTapped()
    }

}
