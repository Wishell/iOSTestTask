//  
//  LogOnModel.swift
//  FitBitCommunication
//
//  Created by Wishell on 05.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

enum LogOnError: Error {
    case emailIncorrect
}

extension LogOnError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emailIncorrect:
            return "Email incorrect"
        }
    }
    
}

// todo make password validator
final class LogOnModel: LogOnModelInput {

    weak var output: LogOnModelOutput!
    var data: LoginData = LoginData()
    
    func CheckError()-> Bool {
        var errorIndex: [Int] = []
        var isError = false
        
        if data.password.isEmpty {
            isError = true
            errorIndex.append(Meta.password.rawValue)
        }
        
        if data.email.isEmpty {
            isError = true
            errorIndex.append(Meta.email.rawValue)
        } else {
            guard EmailValidator.isEmailValid(data.email) else {
                errorIndex.append(Meta.email.rawValue)
                output.modelDidFail(at: errorIndex, LogOnError.emailIncorrect)
                return false
            }
        }

        if isError {
            output.modelDidFail(at: errorIndex, nil)
            return false
        }
        return true
    }
    
    func login() {
        guard self.CheckError() else {return}
        
        print("All ok")
        // connect to fitbit api
        
        
        
    }
}
