//
//  DataSource.swift
//  JsonCoddableUrlSession
//
//  Created by Wishell on 09.11.2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class DataSource: NSObject {
    var items: [Any] = []
}

extension DataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(UITableViewCell.self)"
        let item = items[indexPath.row]

        if type(of: item) == Category.self {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Category") as! CategoryCell
            let `item` = item as! Category
            cell.lable.text = item.name
            return cell
        } else if type(of: item) == ActivityElement.self {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            let `item` = item as! ActivityElement
            cell.textLabel?.text = item.name
            return cell
        } else if type(of: item) == ActivityLevel.self {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            let `item` = item as! ActivityLevel
            cell.textLabel?.text = item.name
            return cell
        }
        return UITableViewCell()
    }

}
