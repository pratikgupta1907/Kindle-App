//
//  PageCell.swift
//  Kindle App
//
//  Created by pratik gupta on 31/10/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "some text on tthis label some text on tthis label some text on tthis label some text on tthis label some text on tthis label some text on tthis label some text on tthis label some text on tthis label some text on tthis label some text on tthis label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textLabel)
        
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
