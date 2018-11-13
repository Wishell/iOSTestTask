//  
//  AutorizationViewController.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class AutorizationViewController: UIViewController {
    
    var model: AutorizationModelInput!
    lazy var contentView: AutorizationViewInput = { return view as! AutorizationViewInput }()
    
}

// MARK: - AutorizationModelOutput
extension AutorizationViewController: AutorizationModelOutput {}

// MARK: - AutorizationViewControllerInput
extension AutorizationViewController: AutorizationViewControllerInput {}
