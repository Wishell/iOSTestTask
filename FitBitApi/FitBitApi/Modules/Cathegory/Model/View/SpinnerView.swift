//
//  SpinnerView.swift
//  FitBitApi
//
//  Created by Wishell on 14.11.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class SpinnerView: UIView {


    @IBOutlet var contentView: UIView!
    @IBOutlet weak var activity: UIActivityIndicatorView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("Spinner", owner: self, options: nil)
        addSubview(contentView)
        contentView.bounds = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        activity.startAnimating()
    }

}
