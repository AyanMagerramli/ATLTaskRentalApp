//
//  SearchVC.swift
//  CarRentalApp
//
//  Created by Ayan on 27.10.23.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
 
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var items: [CarItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        searchCollectionView.register(UINib(nibName: "SearchBarCollectionCell", bundle: nil), forCellWithReuseIdentifier: "SearchBarCollectionCell")
        updateItems()
        searchCollectionView.backgroundColor = .systemGray6
        navigationItem.title = "Search"
    }
    
    func updateItems () {
        coreData.fetchItems()
        items = coreData.items
    }
}

//MARK: -Data Source
extension SearchVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
           return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchBarCollectionCell", for: indexPath) as! SearchBarCollectionCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            cell.carBrand.text = items[indexPath.row].category
            cell.carModel.text = items[indexPath.row].name
            cell.carPrice.text = items[indexPath.row].price
            cell.engineType.text = items[indexPath.row].engine
            return cell
        }
    }
}
//MARK: -Delegate
extension SearchVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

//MARK: -Delegate Flow layout
extension SearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height:collectionView.frame.height/6)
        } else {
            return CGSize(width: collectionView.frame.width-10, height: collectionView.frame.height/6*3)
        }
    }
}
