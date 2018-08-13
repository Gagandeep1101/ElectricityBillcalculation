//
//  ElectricityBill.swift
//  ElectricityBillcalculation
//
//  Created by MacStudent on 2018-08-08.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import Foundation
enum Gender: String {

    
    case MALE  = "MALE"
    case FEMALE = "FEMALE"
}
struct ElectricityBill
{
    var customerId: Int?
    var customerName: String?
    var customerEmail: String?
    var gender: Gender?
    var billDate: String?
    var unitConsumed: Int?
    var totalBillAmount: Double?
}
