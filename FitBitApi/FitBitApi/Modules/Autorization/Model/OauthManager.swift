//
//  OaythManager.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

final class OauthManager {

    private var keyHolder: KeychainHolder

    init (_ keyHolder: KeychainHolder) {
        self.keyHolder = keyHolder
    }

    func handle (_ url: URL) {
        let component = URLComponents(url: url, resolvingAgainstBaseURL: true)
        var urlResult: [String: String] = [:]

        for item in (component?.fragment?.components(separatedBy: "&"))! {
            let arr = item.components(separatedBy: "=")
            urlResult[arr[0]] = arr[1]
        }

        keyHolder["fitbit.userId"] = urlResult["user_id"]
        keyHolder["fitbit.token"] = urlResult["token_type"]! + " " + urlResult["access_token"]!
    }

}
