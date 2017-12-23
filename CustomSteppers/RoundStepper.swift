//
//  FlashyStepper.swift
//  CustomSteppers
//
//  Created by Devontae Reid on 12/22/17.
//  Copyright © 2017 Devontae Reid. All rights reserved.
//

import UIKit

class RoundStepper: UIView {
    
    var value: Int = 0

    private let minusButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let plusButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let numberLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(color: .black)
    }
    
    convenience init(color: UIColor) {
        self.init()
        setupView(color: color)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(color: UIColor) {
        addSubview(minusButton)
        addSubview(numberLabel)
        addSubview(plusButton)
        
        
        updateLabel()
        
        addContraintsWithFormat(format: "H:|[v0(30)][v1][v2(30)]|", views: minusButton,numberLabel,plusButton)
        addContraintsWithFormat(format: "V:|[v0(30)]|", views: minusButton)
        addContraintsWithFormat(format: "V:|[v0(30)]|", views: numberLabel)
        addContraintsWithFormat(format: "V:|[v0(30)]|", views: plusButton)
        
        minusButton.setImage(UIImage(named: "minus_1")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: .normal)
        plusButton.setImage(UIImage(named: "plus_1")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: .normal)
        
        minusButton.tintColor = color
        plusButton.tintColor = color
        numberLabel.textColor = color
        
        minusButton.addTarget(self, action: #selector(decrement(_:)), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(increment(_:)), for: .touchUpInside)
        
        
    }
    
    private func updateLabel() {
        numberLabel.text = "\(value)"
    }
    
    @objc private func increment(_: UIButton) {
        value = value + 1
        updateLabel()
    }
    
    @objc private func decrement(_: UIButton) {
        value = value - 1
        updateLabel()
    }
}


