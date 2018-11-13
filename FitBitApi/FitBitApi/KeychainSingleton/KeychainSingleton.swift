//
//  KeychainSingleton.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation
import KeychainAccess
final class KeychainSingleton {
    static let shared = KeychainSingleton()
    
    let keychain = Keychain(service: "com.Vishneuski.fitbit")
    
    // Initialization
    
    private init(){}
}
