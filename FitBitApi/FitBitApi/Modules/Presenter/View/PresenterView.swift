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
    func stopIndicator ()
    
}

final class PresenterView: UIView {
    
    @IBOutlet weak var table: UITableView!
    var tableDataSource: (() -> DataSource)?
    var onTableItemTap: ((Category) -> Void)?
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.style = .whiteLarge
       // spinner.color = UIColor(ciColor: .blue)
        spinner.center = CGPoint(x: table.bounds.size.width/2, y: table.bounds.size.height/2)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        table.backgroundView = spinner
        
    }

}

// MARK: - PresenterViewInput
extension PresenterView: PresenterViewInput {
    
    func prepare (_ registrate :((UITableView)->Void)){
        registrate(self.table)
    }
    
    func stopIndicator (){
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
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
