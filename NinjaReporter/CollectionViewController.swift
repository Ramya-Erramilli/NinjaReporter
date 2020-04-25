//
//  CollectionViewController.swift
//  NinjaReporter
//
//  Created by Ramya Seshagiri on 20/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

private let reuseIdentifier = "Cell"

let realm = try! Realm()
var results:Results<Ninja>?

class CollectionViewController: UICollectionViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.parent?.navigationController?.navigationBar.backgroundColor = UIColor.green
        
        layoutCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        results = realm.objects(Ninja.self)
//        try! realm.write{
//            realm.deleteAll()
//        }
        self.collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return results!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.nameLabel.text = results![indexPath.row].name?.uppercased()
        cell.expLabel.text = results![indexPath.row].experienc?.uppercased()
        cell.occLabel.text = results![indexPath.row].occupation?.uppercased()
        cell.nameLabel.textAlignment = .center
        cell.expLabel.textAlignment = .center
        cell.occLabel.textAlignment = .center
        cell.nameLabel.sizeToFit()
        cell.expLabel.sizeToFit()
        cell.occLabel.sizeToFit()
        return cell
    }

    func layoutCells() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 5.0
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width-5), height: ((UIScreen.main.bounds.size.height)/7))
        collectionView!.collectionViewLayout = layout
    }
}
