//  
//  DetailsViewController.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    var model: DetailsModelInput!
    lazy var contentView: DetailsViewInput = { return view as! DetailsViewInput }()
    
}

// MARK: - DetailsModelOutput
extension DetailsViewController: DetailsModelOutput {}

// MARK: - DetailsViewControllerInput
extension DetailsViewController: DetailsViewControllerInput {}
