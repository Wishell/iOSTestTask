//  
//  PresenterViewController.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class PresenterViewController: UIViewController {
    
    var model: PresenterModelInput!
    lazy var contentView: PresenterViewInput = { return view as! PresenterViewInput }()
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.stopIndicator()

        self.model.load()
    }
}

// MARK: - PresenterModelOutput
extension PresenterViewController: PresenterModelOutput {
    func modelDidSucces(_ data: Activity) {
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
    
    func modelDidFail() {
        print("AlertController")
    }
}

// MARK: - PresenterViewControllerInput
extension PresenterViewController: PresenterViewControllerInput {}
