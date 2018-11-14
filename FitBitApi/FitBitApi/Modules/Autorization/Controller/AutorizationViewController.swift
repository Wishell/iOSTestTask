//  
//  AutorizationViewController.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import SafariServices

final class AutorizationViewController: UIViewController {
    
    var model: AutorizationModelInput!
    lazy var contentView: AutorizationViewInput = { return view as! AutorizationViewInput }()
    private var safarivc: SFSafariViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.action = { [unowned self] in
            guard let url = URL(string: Constants.authorizationUrl) else {return}
            let vc = SFSafariViewController(url: url)
            self.present(vc, animated: true, completion: nil)
            self.safarivc = vc
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(login), name: .successLogin, object: nil)
    }
    
    @objc func login(){
        safarivc?.dismiss(animated: true) {
            self.performSegue(withIdentifier: "PresenterSeque", sender: nil)
        }
    }
    
}

// MARK: - AutorizationModelOutput
extension AutorizationViewController: AutorizationModelOutput {}

// MARK: - AutorizationViewControllerInput
extension AutorizationViewController: AutorizationViewControllerInput {}

extension Notification.Name {
    
    static let successLogin = Notification.Name("successLogin")
    
}
