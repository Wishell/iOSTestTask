//  
//  PresenterView.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol PresenterViewInput: class {
    
    func prepare (_ registrate :((UITableView)->Void))
    var tableDataSource: (() -> DataSource)? { get set }
    var onTableItemTap: ((Category) -> Void)? { get set }
    func startIndicator ()
    func stopIndicator ()
    
}

final class PresenterView: UIView {
    

    @IBOutlet weak var spinnerView: SpinnerView!
    @IBOutlet weak var table: UITableView!
    var tableDataSource: (() -> DataSource)?
    var onTableItemTap: ((Category) -> Void)?

}

// MARK: - PresenterViewInput
extension PresenterView: PresenterViewInput {
    
    func prepare (_ registrate :((UITableView)->Void)){
        registrate(self.table)
    }
    
    func stopIndicator (){
        DispatchQueue.main.async {
            self.spinnerView.activity.stopAnimating()
            self.sendSubviewToBack(self.spinnerView)
        }
    }
    
    func startIndicator (){
        DispatchQueue.main.async {
            self.spinnerView.activity.startAnimating()
            self.bringSubviewToFront(self.spinnerView)
        }
    }
    
}

extension PresenterView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = tableDataSource?().items[indexPath.row]
        item.flatMap { onTableItemTap?($0) }
    }
    
}
