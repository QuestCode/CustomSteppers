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
        
        self.view.backgroundColor = UIColor(rgb: 0x6D72FE)
        
        let stepper = PullStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.bgColor = UIColor(rgb: 0x6D72FE)
        self.view.addSubview(stepper)
        
        self.view.addContraintsWithFormat(format: "H:|-90-[v0(110)]", views: stepper)
        self.view.addContraintsWithFormat(format: "V:|-90-[v0(50)]", views: stepper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

