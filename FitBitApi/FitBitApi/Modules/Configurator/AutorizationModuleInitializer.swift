//  
//  AutorizationModuleInitializer.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class AutorizationModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: AutorizationViewController!
    
    override func awakeFromNib() {
        let configurator = AutorizationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
