//  
//  PresenterViewController.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import KeychainAccess

final class PresenterViewController: UIViewController {
    
    var model: PresenterModelInput!
    lazy var contentView: PresenterViewInput = { return view as! PresenterViewInput }()
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.startIndicator()
        model.load()
    }
}

// MARK: - PresenterModelOutput
extension PresenterViewController: PresenterModelOutput {
    
    func modelDidSucces(_ data: Activity) {
        contentView.stopIndicator()
        dataSource.items = data.categories
        DispatchQueue.main.async {
            self.contentView.prepare { (table) in
                table.delegate = self.contentView.self as? UITableViewDelegate
                table.dataSource = self.dataSource
                table.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
                table.reloadData()
            }
        }
    }
    
    func modelDidFail(_ error: Error?) {
        UIAlertController.show(self, error: error)
    }
    
}

// MARK: - PresenterViewControllerInput
extension PresenterViewController: PresenterViewControllerInput {}
