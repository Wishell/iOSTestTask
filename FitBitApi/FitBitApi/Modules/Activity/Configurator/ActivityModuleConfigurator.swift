//  
//  ActivityModuleConfigurator.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class ActivityModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? ActivityViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ActivityViewController) {
        let model = ActivityModel()
        model.output = viewController

        viewController.model = model
    }

}
