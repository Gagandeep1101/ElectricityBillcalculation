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
    @IBOutlet weak var switchRememberme: UISwitch!
    var userDefault: UserDefaults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefault = UserDefaults.standard
        if let userId = userDefault?.value(forKey: "email")
        {
            if let userPassword = userDefault?.value(forKey: "password")
            {
                txtUserId.text = userId as? String
                txtPassword.text = userPassword as? String
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoginClick(_ sender: UIButton) {
        if txtUserId.text == "admin@a.com" && txtPassword.text == "admin123"
        {
            if switchRememberme.isOn
            {
                userDefault?.setValue(txtUserId.text, forKey: "email")
                userDefault?.setValue(txtPassword.text, forKey: "password")
            }else{
                userDefault?.removeObject(forKey: "email")
                userDefault?.removeObject(forKey: "password")
            }
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
