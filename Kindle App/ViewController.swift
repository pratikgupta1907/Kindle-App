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
        navigationItem.title = "Kindle"
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        setUpBooks()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = books?.count {
            return count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        cell.book = book
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
        let layout = UICollectionViewFlowLayout()
        let bookPagerController = BookPageController(collectionViewLayout: layout)
        
        bookPagerController.book = selectedBook
        let navController = UINavigationController(rootViewController: bookPagerController)
        present(navController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setUpBooks() {
        let page1 = Page(number: 1, text: "text for the first page")
        let page2 = Page(number: 2, text: "text for the second page")
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaac", pages: [page1, page2], image: #imageLiteral(resourceName: "steve_jobs"))
        
        let book2 = Book(title: "Bill Gates", author: "michael B", pages: [
            Page(number: 1, text: "text for the first page"),
            Page(number: 2, text: "text for the second page"),
            Page(number: 3, text: "text for the third page"),
            Page(number: 4, text: "text for the fourth page")
            ], image: #imageLiteral(resourceName: "bill_gates"))
        
        let book3 = Book(title: "Amazon", author: "jeff B", pages: [
            Page(number: 1, text: "text for the first page"),
            Page(number: 2, text: "text for the second page"),
            Page(number: 3, text: "text for the third page"),
            Page(number: 4, text: "text for the fourth page")
            ], image: #imageLiteral(resourceName: "amazon_icon-2"))
        
        self.books = [book, book2, book3]
    }
}

