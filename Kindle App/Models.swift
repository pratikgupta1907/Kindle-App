//
//  Models.swift
//  Kindle App
//
//  Created by pratik gupta on 01/10/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class Book {
    
    let title: String
    let author: String
    let pages: [Page]
    
    init(title: String, author: String, pages: [Page]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}

class Page {
    
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
    
}

