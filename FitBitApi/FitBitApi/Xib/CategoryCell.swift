//
//  CategoryCell.swift
//  FitBitApi
//
//  Created by Wishell on 15.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var lable: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        lable.text = nil
    }
    
}
