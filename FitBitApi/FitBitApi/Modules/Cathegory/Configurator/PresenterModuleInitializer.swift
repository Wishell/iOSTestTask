//
//  PresenterModuleInitializer.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class PresenterModuleInitializer: NSObject {

    @IBOutlet weak var viewController: PresenterViewController!

    override func awakeFromNib() {
        let configurator = PresenterModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }

}
