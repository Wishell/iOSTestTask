//
//  Date+ToString.swift
//  FitBitApi
//
//  Created by Wishell on 15.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

extension Date {

    func toFormattedString(format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
