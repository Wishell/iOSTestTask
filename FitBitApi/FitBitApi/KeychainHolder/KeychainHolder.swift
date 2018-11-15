//
//  KeychainSingleton.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation
import KeychainAccess

final class KeychainHolder {

    let keychain: Keychain = Keychain(service: "com.Vishneuski.fitbit")

    subscript (key: String) -> String? {
        get {
            return keychain[key]
        }
        set {
            keychain[key] = newValue
        }
    }

}
