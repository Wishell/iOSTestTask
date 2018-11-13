//  
//  PresenterViewController.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class PresenterViewController: UIViewController {
    
    var model: PresenterModelInput!
    lazy var contentView: PresenterViewInput = { return view as! PresenterViewInput }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - PresenterModelOutput
extension PresenterViewController: PresenterModelOutput {}

// MARK: - PresenterViewControllerInput
extension PresenterViewController: PresenterViewControllerInput {}
