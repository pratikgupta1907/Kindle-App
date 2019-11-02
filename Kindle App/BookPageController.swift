//
//  BookPageController.swift
//  Kindle App
//
//  Created by pratik gupta on 31/10/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class BookPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBarStyles()
        collectionView.backgroundColor = .white
        navigationItem.title = book?.title
        // .self will going to give class type cell
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        
        collectionView.isPagingEnabled = true
        
        let leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
        leftBarButtonItem.tintColor = .white
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func setUpNavigationBarStyles() {
        navigationController?.navigationBar.barTintColor = UIColor(hue: 40/255, saturation: 40/255, brightness: 40/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @objc func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = book?.pages?[indexPath.row]
        pageCell.textLabel.text = page?.text
        
        return pageCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - view.frame.width / 3)
    }
    
}
