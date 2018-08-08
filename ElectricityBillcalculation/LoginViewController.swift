//
//  LoginViewController.swift
//  ElectricityBillcalculation
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLoginClick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoginClick(_ sender: UIButton) {
        if(txtUserId.text == "admin@a.com" && txtPassword.text == "ADMIN")
        {
             performSegue(withIdentifier: "showBillCalculationScreen", sender: self)
            print("Login Success", txtUserId.text!)
            
        }
        else{
            print("User Email / Password incorrect")
        }
        
       
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
