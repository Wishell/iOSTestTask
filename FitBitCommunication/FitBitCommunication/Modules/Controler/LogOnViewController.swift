//  
//  LogOnViewController.swift
//  FitBitCommunication
//
//  Created by Wishell on 05.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class LogOnViewController: UIViewController {
    
    var model: LogOnModelInput!
    lazy var contentView: LogOnViewInput = { return view as! LogOnViewInput }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.textChange = { [unowned self] (field, tag) in
            self.model.data[tag] = field
        }
        contentView.action = { [unowned self] in
            self.model.login()
        }
        
    }
    
}

// MARK: - LogOnModelOutput
extension LogOnViewController: LogOnModelOutput {
    func modelDidLogin() {
        
    }
    func modelDidFail(at fields: [Int],_ error: Error?) {
        if let `error` = error {
            let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        contentView.shaking(fields: fields)
        
    }
}

// MARK: - LogOnViewControllerInput
extension LogOnViewController: LogOnViewControllerInput {}
