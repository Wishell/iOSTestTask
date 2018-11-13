//  
//  AutorizationModuleConfigurator.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class AutorizationModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? AutorizationViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: AutorizationViewController) {
        let model = AutorizationModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}