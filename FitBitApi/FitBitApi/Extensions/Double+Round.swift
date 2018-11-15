//
//  Double+Round.swift
//  FitBitApi
//
//  Created by Wishell on 15.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toNumberAfterZero countAfterZero: Int) -> Double {
        let divisor = pow(10.0, Double(countAfterZero))
        return (self * divisor).rounded() / divisor
    }
}
