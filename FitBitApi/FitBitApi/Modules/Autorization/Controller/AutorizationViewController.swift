//  
//  AutorizationViewController.swift
//  FitBitApi
//
//  Created by Wishell on 13.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import SafariServices
import KeychainAccess

final class AutorizationViewController: UIViewController {
    
    var model: AutorizationModelInput!
    lazy var contentView: AutorizationViewInput = { return view as! AutorizationViewInput }()
    private let url = "https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=22D5LD&redirect_uri=Fbit%3A%2F%2Fviv.health%2Fpicker&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800"
    
    private var isAutrisationSuccess: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.action = { [unowned self] in
            let safarivc = SFSafariViewController(url: URL(string: self.url)! )
            self.present(safarivc, animated: true, completion: nil)
        }
    }
    

    
}

// MARK: - AutorizationModelOutput
extension AutorizationViewController: AutorizationModelOutput {
    
    func modelDidSucces(_ data: Activity) {
        data.categories.forEach { print($0)
        }
    }
    
    func modelDidFail() {
        print("AlertController")
    }
}

// MARK: - AutorizationViewControllerInput
extension AutorizationViewController: AutorizationViewControllerInput {
    func login(){
        self.model.load()
    }
}
