//  
//  AutorizationView.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol AutorizationViewInput: class {
    var action: (()->Void)? {get set}}

final class AutorizationView: UIView {
    
    @IBAction func OnLoginTap(_ sender: Any) {
        action?()
    }
    
    var action: (()->Void)?
    
}

// MARK: - AutorizationViewInput
extension AutorizationView: AutorizationViewInput {}
