//
//  ViewController.swift
//  Kindle App
//
//  Created by pratik gupta on 28/09/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Kindle"
        
        
        setUpBooks()
    }
    
    func setUpBooks() {
        let page1 = Page(number: 1, text: "text for the first page")
        let page2 = Page(number: 2, text: "text for the second page")
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaac", pages: [page1, page2])
        
        let book2 = Book(title: "Bill Gates", author: "michael B", pages: [
            Page(number: 1, text: "text for the first page"),
            Page(number: 2, text: "text for the second page"),
            Page(number: 3, text: "text for the third page"),
            Page(number: 4, text: "text for the fourth page")
            ])
        
        self.books = [book, book2]
        
        guard let books = self.books else { return }
        
        for book in books {
            print(book.title)
            for page in book.pages {
                print(page.text)
            }
        }
    }
}

