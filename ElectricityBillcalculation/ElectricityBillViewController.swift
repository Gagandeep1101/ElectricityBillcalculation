//
//  ElectricityBillViewController.swift
//  ElectricityBillcalculation
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController {
    
    var electricityBill: ElectricityBill?

    @IBOutlet weak var txtCustID: UITextField!
    @IBOutlet weak var txtCustName: UITextField!
    @IBOutlet weak var txtTotalUnit: UITextField!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var txtBdate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBillCalculationClick(_ sender: UIButton) {
        
        //Validate data before creating object
        electricityBill = ElectricityBill(customerId:Int(txtCustID.text!), customerName: String(txtCustName.text!), gender: Gender.FEMALE, billDate: Date(), unitConsumed: Int(txtTotalUnit.text!), totalBillAmount: 0)
        performSegue(withIdentifier: "nv", sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let destVC = segue.destination as? BillDetailViewController
        {
            //let destVC = segue.destination as! BillDetailViewController
            destVC.electricityBill = electricityBill
        }
        // Pass the selected object to the new view controller.
    }
 

}
