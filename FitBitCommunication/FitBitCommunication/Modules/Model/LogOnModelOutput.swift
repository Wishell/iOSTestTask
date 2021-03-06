//  
//  LogOnModelOutput.swift
//  FitBitCommunication
//
//  Created by Wishell on 05.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

protocol LogOnModelOutput: class {
    func modelDidLogin()
    func modelDidFail(at fields: [Int],_ error: Error?)
}
