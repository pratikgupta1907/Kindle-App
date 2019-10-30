//
//  BookCell.swift
//  Kindle App
//
//  Created by pratik gupta on 30/10/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    let coverImageView: UIImageView = {
        
        let imageView = UIImageView()
       imageView.backgroundColor = .red
        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .green
        label.text = "this is the text for the tile of our label inside of our cell"
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .yellow
        label.text = "this is the author for the tile of our label of our cell"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(coverImageView)
        addSubview(titleLabel)
        addSubview(authorLabel)
        coverImageView.frame = CGRect(x: 8, y: 8, width: 64, height: 64)
        titleLabel.frame = CGRect(x: 82, y: 0, width: 300, height: 50)
        authorLabel.frame = CGRect(x: 82, y: 45, width: 300, height: 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
