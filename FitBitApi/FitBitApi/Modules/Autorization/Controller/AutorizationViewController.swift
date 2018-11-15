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
    var date: Date?
    var safariVC: SFSafariViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.action = { [unowned self] in
            guard let url = URL(string: Constants.FitBitUrlApi2.authorizationUrl) else { return }
            let vc = SFSafariViewController(url: url)
            self.present(vc, animated: true, completion: nil)
            self.safariVC = vc
        }

        NotificationCenter.default.addObserver(self, selector: #selector(login), name: .successLogin, object: nil)
    }

    @objc func login() {
        date = contentView.getDate()
        self.performSegue(withIdentifier: "PresenterSeque", sender: nil)
        safariVC?.dismiss(animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresenterSeque" {
            let controller = segue.destination as! CathegoryViewController
            controller.set(self.date!)
        }
    }

}

// MARK: - AutorizationModelOutput
extension AutorizationViewController: AutorizationModelOutput { }

// MARK: - AutorizationViewControllerInput
extension AutorizationViewController: AutorizationViewControllerInput { }

// MARK: - Notification.Name
extension Notification.Name {

    static let successLogin = Notification.Name("successLogin")

}
