//
//  AutorizationView.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol AutorizationViewInput: class {
    var action: (() -> Void)? { get set }
    func getDate() -> String
}

final class AutorizationView: UIView {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func OnLoginTap(_ sender: Any) {
        action?()
    }

    var action: (() -> Void)?

}

// MARK: - AutorizationViewInput
extension AutorizationView: AutorizationViewInput {

    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.FitBitUrlApi2.dateFormat
        return dateFormatter.string(from: datePicker.date)
    }

}
