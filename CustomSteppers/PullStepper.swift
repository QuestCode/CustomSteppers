//
//  PullStepper.swift
//  CustomSteppers
//
//  Created by Devontae Reid on 12/22/17.
//  Copyright © 2017 Devontae Reid. All rights reserved.
//

import UIKit

class PullStepper: UIView {

    var value: Int = 0
    var bgColor: UIColor = .black
    var roundViewColor: UIColor = .white
    var centerOfView: CGFloat = 0
    
    
    
    private let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let minusView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "minus_2")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        return view
    }()
    
    private let plusView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "plus_2")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        return view
    }()
    
    private let numberLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .red
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        updateLabel()
        
        addSubview(bgView)
        let bgWhiteView = UIView(frame: bgView.frame)
        bgView.addSubview(bgWhiteView)
        
        bgView.addSubview(minusView)
        bgView.addSubview(numberLabel)
        bgView.addSubview(plusView)
        bgView.bringSubview(toFront: numberLabel)
        
        
        // MARK: Constraints Section
        addContraintsWithFormat(format: "H:|[v0]|", views: bgView)
        addContraintsWithFormat(format: "V:|[v0]|", views: bgView)
        
        bgView.addContraintsWithFormat(format: "H:|[v0(30)][v1(50)][v2(30)]|", views: minusView,numberLabel,plusView)
        bgView.addContraintsWithFormat(format: "V:|-10-[v0(30)]", views: minusView)
        bgView.addContraintsWithFormat(format: "V:|[v0(50)]|", views: numberLabel)
        bgView.addContraintsWithFormat(format: "V:|-10-[v0(30)]", views: plusView)
        
        print(centerOfView)
        
        // MARK: Design Sections
        bgView.backgroundColor = bgColor
        bgView.layer.cornerRadius = 25
        
        bgWhiteView.backgroundColor = .white
        bgWhiteView.alpha = 0.7
        
        
        
        bgView.clipsToBounds = true
        minusView.tintColor = roundViewColor
        plusView.tintColor = roundViewColor
        
        numberLabel.backgroundColor = roundViewColor
        numberLabel.textColor = bgColor
        numberLabel.layer.cornerRadius = 24
        numberLabel.clipsToBounds = true
    
        
        addPanGesture(view: numberLabel)
        
        
        
    }
    
    private func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlerPan(sender:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(pan)
    }
    
    @objc private func handlerPan(sender: UIPanGestureRecognizer) {
        let numberView = sender.view
        let translation = sender.translation(in: bgView)
        
        switch sender.state {
        case .began, .changed:
            numberView?.center = CGPoint(x: (numberView?.center.x)! + translation.x/4, y: (numberView?.center.y)!)
            sender.setTranslation(CGPoint.zero, in: bgView)
        case .ended:
            if (numberView?.frame.intersects(minusView.frame))! {
                UIView.animate(withDuration: 0.3, animations: {
                    self.decrement()
                    self.numberLabel.center.x = 55
                })
            } else if (numberView?.frame.intersects(plusView.frame))! {
                UIView.animate(withDuration: 0.3, animations: {
                    self.increment()
                    self.numberLabel.center.x = 55
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                   self.numberLabel.center.x = 55
                })
            }
            break
        default:
            break
        }
    }
    
    private func updateLabel() {
        numberLabel.text = "\(value)"
    }
    
    @objc private func increment() {
        value = value + 1
        updateLabel()
    }
    
    @objc private func decrement() {
        value = value - 1
        updateLabel()
    }

}
