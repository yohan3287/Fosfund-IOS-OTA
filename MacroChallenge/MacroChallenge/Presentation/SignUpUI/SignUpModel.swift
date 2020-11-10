//
//  SignUpModel.swift
//  MacroChallenge
//
//  Created by Dickie Mandela on 03/11/20.
//

import Foundation

struct SignUpModel: Decodable{
    let email: String
    let name: String
    let password: String
    let phoneNumber: String
    let retypePassword: String
}

