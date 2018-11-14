//  
//  ActivityView.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol ActivityViewInput: class {}

final class ActivityView: UIView {
    
    @IBOutlet weak var table: UITableView!
    
}

// MARK: - ActivityViewInput
extension ActivityView: ActivityViewInput {}
