//
//  PresenterModuleInitializer.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class CathegoryModuleInitializer: NSObject {

    @IBOutlet weak var viewController: CathegoryViewController!

    override func awakeFromNib() {
        let configurator = CathegoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }

}
