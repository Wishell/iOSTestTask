//  
//  ActivityViewController.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class ActivityViewController: UIViewController {
    
    var model: ActivityModelInput!
    lazy var contentView: ActivityViewInput = { return view as! ActivityViewInput }()
    
}

// MARK: - ActivityModelOutput
extension ActivityViewController: ActivityModelOutput {}

// MARK: - ActivityViewControllerInput
extension ActivityViewController: ActivityViewControllerInput {
    
    func set (_ data: [ActivityElement]) {
        model.data = data
    }
    
}
