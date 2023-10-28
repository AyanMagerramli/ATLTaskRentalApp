//
//  CarCategoryCell.swift
//  CarRentalApp
//
//  Created by Ayan on 26.10.23.
//

import UIKit


class CarCategoryCell: UITableViewCell {

    @IBOutlet weak var carCategoryCollection: UICollectionView!
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var categories = CarCategory.self
    var items = [CarItems]()
    var selectedCategory: CarCategory?
  //  var delegate: CarCategoryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        carCategoryCollection.backgroundColor = .systemGray6
        carCategoryCollection.register(UINib(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionCell")
//        carCategoryCollection.dataSource = self
//        carCategoryCollection.delegate = self
        updateItems()
    }

    func updateItems () {
        coreData.fetchItems()
        items = coreData.items
       //UserDefaults.standard.setValue(true, forKey: "isDataLoaded")
    }
}

//MARK: -Data Source
//extension CarCategoryCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        categories.allCases.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
//        let category = categories.allCases[indexPath.row]
//        cell.categoryType.text = String(describing: category)
//        let categoryCount: Int
//        switch category {
//        case .Suv:
//            categoryCount = items.filter{$0.category == "Suv"}.count
//        case .econom:
//            categoryCount = items.filter{$0.category == "Econom"}.count
//        case .prestige:
//            categoryCount = items.filter{$0.category == "Prestige"}.count
//        case .standart:
//            categoryCount = items.filter{$0.category == "Standart"}.count
//        }
//        selectedCategory = category
//        cell.categorySize.text = String(categoryCount)
//        return cell
//    }
//}
//
////MARK: -Delegate
//extension CarCategoryCell: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//     //   delegate?.carCategorySelected(selectedCategory!)
//    }
//}
//
////MARK: -Flow layout
//extension CarCategoryCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width/2-15, height: collectionView.frame.height-10)
//    }
//}
//
