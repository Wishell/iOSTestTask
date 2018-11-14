//  
//  ActivityModuleInitializer.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class ActivityModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: ActivityViewController!
    
    override func awakeFromNib() {
        let configurator = ActivityModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
