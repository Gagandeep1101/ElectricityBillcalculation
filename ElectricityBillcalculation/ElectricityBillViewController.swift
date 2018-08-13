//
//  ElectricityBillViewController.swift
//  ElectricityBillcalculation
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController, UITextFieldDelegate, PassDataProtocol {
   
    var electricityBill: ElectricityBill?

    @IBOutlet weak var txtCustID: UITextField!
    @IBOutlet weak var txtCustName: UITextField!
    @IBOutlet weak var txtTotalUnit: UITextField!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var lblTotalBillAmount: UILabel!
    @IBOutlet weak var txtBdate: UITextField!
    @IBOutlet weak var txtCustEmail: UITextField!
    var datePicker : UIDatePicker!
    
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
        electricityBill = ElectricityBill(customerId:Int(txtCustID.text!), customerName: String(txtCustName.text!), customerEmail: String(txtCustEmail.text!), gender: Gender.FEMALE, billDate: txtBdate.text, unitConsumed: Int(txtTotalUnit.text!), totalBillAmount: 0)
        
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
            destVC.delegate = self
        }
        // Pass the selected object to the new view controller.
    }
 
    func setTotal(totalBill: Double) {
        print("A = \(totalBill)")
        self.electricityBill?.totalBillAmount = totalBill
        lblTotalBillAmount.isHidden = false
        lblTotalBillAmount.text = "Total Bill : $\(totalBill)"
        
        
    }
    
    @IBAction func btnLogOut(_ sender: UIButton) {
        
    }
    
    
    //MARK:- textFiled Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(self.txtBdate)
    }
    
    //MARK:- Function of datePicker
    func pickUpDate(_ textField : UITextField){
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ElectricityBillViewController.doneClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ElectricityBillViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    // MARK:- Button Done and Cancel
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        txtBdate.text = dateFormatter1.string(from: datePicker.date)
        txtBdate.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        txtBdate.resignFirstResponder()
    }
    
}
