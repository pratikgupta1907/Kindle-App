//
//  Models.swift
//  Kindle App
//
//  Created by pratik gupta on 01/10/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

struct Book: Decodable {
    let id: Int
    let title: String
    let author: String
    let coverImageUrl: String
    var pages: [Page]?
}

struct Page: Decodable {
    let id: Int
    let text: String
}
