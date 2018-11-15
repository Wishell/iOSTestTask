//
//  ActivityView.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol ActivityViewInput: class {

    func prepare (_ registrate: ((UITableView) -> Void))
    var tableDataSource: (() -> DataSource)? { get set }
    var onTableItemTap: ((Category) -> Void)? { get set }
    func startIndicator ()
    func stopIndicator ()

}

final class ActivityView: UIView {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var spinnerView: SpinnerView!
    var onTableItemTap: ((Category) -> Void)?
    var tableDataSource: (() -> DataSource)?

}

// MARK: - ActivityViewInput
extension ActivityView: ActivityViewInput {

    func prepare (_ registrate: ((UITableView) -> Void)) {
        registrate(self.table)
    }

    func stopIndicator () {
        DispatchQueue.main.async {
            self.spinnerView.activity.stopAnimating()
            self.sendSubviewToBack(self.spinnerView)
        }
    }

    func startIndicator () {
        DispatchQueue.main.async {
            self.spinnerView.activity.startAnimating()
            self.bringSubviewToFront(self.spinnerView)
        }
    }

}
