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

