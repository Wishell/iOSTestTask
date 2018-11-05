//  
//  LogOnModuleInitializer.swift
//  FitBitCommunication
//
//  Created by Wishell on 05.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class LogOnModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: LogOnViewController!
    
    override func awakeFromNib() {
        let configurator = LogOnModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
