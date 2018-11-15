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
    private var prepareClousure: ((UITableView) -> Void)?
    private var registerClousure: ((UITableView, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareClousure = { [unowned self] (table) in
            table.delegate = self.contentView.self as? UITableViewDelegate
            table.dataSource = self.dataSource
            table.reloadData()
        }
        registerClousure = { (table, cellName) in
            let nib = UINib(nibName: cellName, bundle: nil)
            table.register(nib, forCellReuseIdentifier: cellName)
        }
        model.load()
        contentView.startIndicator()
        contentView.tableDataSource = { [unowned self] in return self.dataSource }
        contentView.onTableItemTap = { [unowned self] item in
            if type(of: item) == Category.self {
                let `item` = item as! Category
                if let subCategories = item.subCategories {
                    self.dataSource.items.append(contentsOf: subCategories.compactMap { return $0 })
                    self.contentView.registerCell(self.registerClousure!, cellName: "Category")
                }
                self.dataSource.items = item.activities
                self.contentView.registerCell(self.registerClousure!, cellName: "ActivityElementCell")
                self.contentView.prepareTable(self.prepareClousure!)
            } else if type(of: item) == ActivityElement.self {
                let `item` = item as! ActivityElement
                guard let level = item.activityLevels else { return }
                let activities = level.compactMap { !$0.name.isEmpty }
                guard !activities.isEmpty else { return }
                self.performSegue(withIdentifier: "ActivitySeque", sender: item)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ActivitySeque", let data = sender as? ActivityElement {
            let controller = segue.destination as! ActivityViewController
            controller.set(data.activityLevels!)
        }
    }
}

// MARK: - PresenterModelOutput
extension PresenterViewController: PresenterModelOutput {

    func modelDidSucces(_ data: Activity) {
        contentView.stopIndicator()
        dataSource.items = data.categories
        DispatchQueue.main.async {
            self.contentView.registerCell(self.registerClousure!, cellName: "Category")
            self.contentView.prepareTable(self.prepareClousure!)
        }
    }

    func modelDidFail(_ error: Error?) {
        UIAlertController.show(self, error: error)
    }

}

// MARK: - PresenterViewControllerInput
extension PresenterViewController: PresenterViewControllerInput {

    func set (_ date: String) {
        self.model.date = date
    }

}
