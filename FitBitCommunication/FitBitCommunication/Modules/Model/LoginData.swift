//
//  LoginData.swift
//  FitBitCommunication
//
//  Created by Wishell on 07.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

struct LoginData {
    var email: String = ""
    var password: String = ""
    
     var isAllFieldSet: Bool  { return !email.isEmpty && !password.isEmpty }
}

    enum Meta : Int {
        case email = 1
        case password = 2
        
        var stringValue: String  {
            switch self {
            case .email: return "email"
            case .password: return "password"
            }
        }
    }


extension LoginData {
    subscript (_ index: Int)-> String {
        get {
            switch index {
            case 1: return email
            case 2: return password
            default: return ""
            }
        }
        set {
            switch index {
            case 1: email = newValue
            case 2: password = newValue
            default: break
            }
        }
    }
}
