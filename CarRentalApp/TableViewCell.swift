//
//  TableViewCell.swift
//  CarRentalApp
//
//  Created by Ayan on 26.10.23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var items = [CarItems]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.backgroundColor = .systemGray6
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        updateItems()
    }
    func updateItems () {
        coreData.fetchItems()
        items = coreData.items
        UserDefaults.standard.setValue(true, forKey: "isDataLoaded")
    }

}

//MARK: Data Source
extension TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.carPrice.text = items[indexPath.row].price
        cell.carModel.text = items[indexPath.row].name
        cell.carBrand.text = items[indexPath.row].category
        cell.engineType.text = items[indexPath.row].engine
        return cell
    }
}
//MARK: Delegate
extension TableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

//MARK: Flow layout
extension TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-10, height: collectionView.frame.height-70)
    }
}
