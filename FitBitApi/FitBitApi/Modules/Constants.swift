//
//  Constants.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

enum ActivityType: String {
    case activities = "/activities"
    case heartrate = "/heart"
}

struct Constants {

    struct FitBitUrlApi2 {
        static let authorizationUrl = "https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=22D5LD&redirect_uri=Fbit%3A%2F%2Fviv.health%2Fpicker&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800"

        static let prefixUrl = "https://api.fitbit.com/1/user/"
        static let formatType: String = ".json"
        static let dateFormat: String = "YYYY-MM-dd"

        private init() { }
    }

    private init() { }

}
