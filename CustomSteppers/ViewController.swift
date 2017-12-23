//
//  ViewController.swift
//  CustomSteppers
//
//  Created by Devontae Reid on 12/22/17.
//  Copyright © 2017 Devontae Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let stepper = PullStepper(color: UIColor(rgb: 0x009966))
        stepper.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stepper)
        
        self.view.addContraintsWithFormat(format: "H:|-20-[v0(90)]", views: stepper)
        self.view.addContraintsWithFormat(format: "V:|-30-[v0(30)]", views: stepper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

