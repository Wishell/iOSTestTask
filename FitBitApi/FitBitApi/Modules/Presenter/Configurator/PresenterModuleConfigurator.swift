//  
//  PresenterModuleConfigurator.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class PresenterModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? PresenterViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: PresenterViewController) {
        let model = PresenterModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
