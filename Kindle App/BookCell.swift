//
//  BookCell.swift
//  Kindle App
//
//  Created by pratik gupta on 30/10/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
