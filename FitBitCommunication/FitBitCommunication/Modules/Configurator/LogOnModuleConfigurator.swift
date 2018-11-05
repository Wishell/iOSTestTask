//  
//  LogOnModuleConfigurator.swift
//  FitBitCommunication
//
//  Created by Wishell on 05.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class LogOnModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? LogOnViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: LogOnViewController) {
        let model = LogOnModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
