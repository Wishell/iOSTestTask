//  
//  DetailsModuleInitializer.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class DetailsModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: DetailsViewController!
    
    override func awakeFromNib() {
        let configurator = DetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
