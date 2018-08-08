//
//  ViewController.swift
//  ElectricityBillcalculation
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        perform(#selector(self.showNavController), with: nil, afterDelay: 5)
       // perform(Selector(("showNavController")), with: nil, afterDelay: 10)
}
    @objc func showNavController()
{
    performSegue(withIdentifier: "showLoginViewScreen", sender: self)
}
}
