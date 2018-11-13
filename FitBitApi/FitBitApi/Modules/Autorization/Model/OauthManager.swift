//
//  OaythManager.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation
import KeychainAccess



final class OauthManager {
    
    private var urlResult:[String:String] = [:]
    
    private let keychain: Keychain!

    init() {
        self.keychain = KeychainSingleton.shared.keychain
    }
    
    func handle (_ url: URL){
        let component = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        for item in (component?.fragment?.components(separatedBy: "&"))!{
            let arr = item.components(separatedBy: "=")
            urlResult[arr[0]] = arr[1]
        }
    
        
        keychain["fitbit.userId"] = urlResult["user_id"]
        keychain["fitbit.token"] = urlResult["token_type"]! + " " + urlResult["access_token"]!
    }
}
