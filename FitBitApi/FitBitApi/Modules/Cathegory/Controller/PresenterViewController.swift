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
    private var prepareClousure: ((UITableView)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareClousure = {[unowned self] (table) in
            table.delegate = self.contentView.self as? UITableViewDelegate
            table.dataSource = self.dataSource
            table.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
            table.reloadData()
        }
        model.load()
        contentView.startIndicator()
        contentView.tableDataSource = { [unowned self] in return self.dataSource }
        contentView.onTableItemTap = { [unowned self] item in
            if type(of: item) == Category.self {
                let `item` = item as! Category
                self.dataSource.items = item.activities
                guard let subCategories = item.subCategories else {return}
                subCategories.compactMap{self.dataSource.items.append($0)}
            } else if type(of: item) == ActivityElement.self {
                let `item` = item as! ActivityElement
                guard let level = item.activityLevels else { return }
                self.dataSource.items = level
            }
            self.contentView.prepare(self.prepareClousure!)
        }
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ActivitySeque", let data = sender as? Category {
            let controller = segue.destination as! ActivityViewController
            controller.set(data.activities)
        }
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
                let nib = UINib(nibName: "Category", bundle: nil)
                table.register(nib, forCellReuseIdentifier: "Category")
                table.reloadData()
            }
        }
    }

    func modelDidFail(_ error: Error?) {
        UIAlertController.show(self, error: error)
    }

}

// MARK: - PresenterViewControllerInput
extension PresenterViewController: PresenterViewControllerInput { }
