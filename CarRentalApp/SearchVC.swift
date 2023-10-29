//
//  SearchVC.swift
//  CarRentalApp
//
//  Created by Ayan on 27.10.23.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchFieldView: UIView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
 
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var items: [CarList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFieldView.layer.cornerRadius = 30
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        updateItems()
        navigationItem.title = "Search"
    }
    
    @IBAction func searchAction(_ sender: Any) {
        searchCollectionView.reloadData()
        if let searchText = searchText.text {
            items = coreData.items.filter({ carItem in
                return (carItem.name?.lowercased() ?? "").contains(searchText.lowercased()) ||
                (carItem.category?.lowercased() ?? "").contains(searchText.lowercased())
            })
        } 
    }
    
    func updateItems () {
        coreData.fetchItems()
        items = coreData.items
    }
}

//MARK: -Data Source
extension SearchVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.layer.cornerRadius = 35
        cell.configureCarCell(data: items[indexPath.row])
        return cell
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
        .init(width: collectionView.frame.width*0.855, height: 340)
    }
}
