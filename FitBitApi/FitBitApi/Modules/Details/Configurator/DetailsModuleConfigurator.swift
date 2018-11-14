//  
//  DetailsModuleConfigurator.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class DetailsModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? DetailsViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: DetailsViewController) {
        let model = DetailsModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
