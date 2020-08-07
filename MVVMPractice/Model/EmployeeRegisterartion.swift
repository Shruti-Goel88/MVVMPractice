//
//  EmployeeRegisterartion.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/30/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import Foundation

struct EmployeeRegisterationRequest : Encodable{
    let FirstName, LastName, Email, Password : String

    enum CodingKeys: String, CodingKey {
        case FirstName = "First_Name"
        case LastName = "Last_Name"
        case Email, Password
    }
}

struct EmployeeRegistrationResponse: Decodable {
    let errorMessage: String
    let data: UserData
}


struct UserData: Decodable {
    let name, email, id, joining: String
}
