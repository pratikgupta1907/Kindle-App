//
//  ViewController.swift
//  Kindle App
//
//  Created by pratik gupta on 28/09/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UITableViewController {

    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBarStyles()
        setUpNavigationBarButton()
        navigationItem.title = "Kindle"
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.isSkeletonable = true
        tableView.backgroundColor = .lightGray
        tableView.tableFooterView = UIView()
        fetchBooks()
    }
    
    func setUpNavigationBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu-2"), style: .plain, target: self, action: #selector(handleMenuPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon-2"), style: .plain, target: self, action: #selector(handleMenuPressed))

    }
    
    @objc func handleMenuPressed() {
        print("menu pressed")
    }
    func setUpNavigationBarStyles() {
        navigationController?.navigationBar.barTintColor = UIColor(hue: 40/255, saturation: 40/255, brightness: 40/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func fetchBooks() {
        let urlString = "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let err = err {
                print("Failed to fetch data from", err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let books = try decoder.decode([Book].self, from: data)
                self.books = books
                DispatchQueue.main.async(execute: { () -> Void in
                    self.tableView?.reloadData()
                })
            } catch let jsonErr {
                print("Failed to parse json:", jsonErr)
            }
            
            }.resume()
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
        let navController = LightStatusBarNavigationController(rootViewController: bookPagerController)
        present(navController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(hue: 40/255, saturation: 40/255, brightness: 40/255, alpha: 1)
        
        let segmentedControl = UISegmentedControl(items: ["Cloud", "Device"])
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(segmentedControl)
        
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        let gridButton = UIButton(type: .system)
        gridButton.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(gridButton)

        
        gridButton.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 10).isActive = true
        gridButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        let sortButton = UIButton(type: .system)
        sortButton.setImage(#imageLiteral(resourceName: "sort"), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(sortButton)
        
        
        sortButton.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -10).isActive = true
        sortButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
   
}

