//
//  PresenterModuleConfigurator.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class CathegoryModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? CathegoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CathegoryViewController) {
        let holder = KeychainHolder()
        let model = CathegoryModel()

        model.output = viewController
        model.holder = holder

        viewController.model = model
    }

}
