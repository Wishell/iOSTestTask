//
//  UIAlertController+ErrorDescription.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import Foundation

import UIKit

extension UIAlertController {
    
    static func show(_ viewController: UIViewController, error: Error?) {
        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
