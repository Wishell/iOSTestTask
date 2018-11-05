//  
//  LogOnViewController.swift
//  FitBitCommunication
//
//  Created by Wishell on 05.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class LogOnViewController: UIViewController {
    
    var model: LogOnModelInput!
    lazy var contentView: LogOnViewInput = { return view as! LogOnViewInput }()
    
}

// MARK: - LogOnModelOutput
extension LogOnViewController: LogOnModelOutput {}

// MARK: - LogOnViewControllerInput
extension LogOnViewController: LogOnViewControllerInput {}
