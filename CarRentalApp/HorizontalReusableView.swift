//
//  HorizontalReusableView.swift
//  CarRentalApp
//
//  Created by Ayan on 28.10.23.
//

import UIKit

//MARK: Delegate for Car Category selection
protocol CarCategoryCellDelegate {
    func carCategorySelected (_ category: CarCategory)
}

class HorizontalReusableView: UICollectionReusableView {

    @IBOutlet weak var horizontalCollection: UICollectionView!
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var categories = CarCategory.self
    var items = [CarItems]()
    var selectedCategory: CarCategory?
    var delegate: CarCategoryCellDelegate?
    var selectedIndex: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        horizontalCollection.dataSource = self
        horizontalCollection.delegate = self
        horizontalCollection.register(UINib(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionCell")
        updateItems()
    }
    
    func updateItems () {
        coreData.fetchItems()
        items = coreData.items
        print(items)
    }
}

//MARK: -Collection View Data Source
extension HorizontalReusableView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.allCases.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionCell",
            for: indexPath
        ) as! CategoryCollectionCell
        
        let category = categories.allCases[indexPath.row]
        cell.categoryType.text = String(describing: category)
        
        let categoryCount = items.filter{$0.category?.lowercased() == category.rawValue}.count
        
        cell.categorySize.text = String(categoryCount)
        cell.layer.cornerRadius = 15
        //in order to change background color into blue
        //and text colors into white
        if indexPath == selectedIndex{
            cell.categoryView.backgroundColor = .systemBlue
            cell.categorySize.textColor = .white
            cell.categoryType.textColor = .white
        } else {
            cell.categoryView.backgroundColor = .white
            cell.categorySize.textColor = .black
            cell.categoryType.textColor = .black
        }
        return cell
    }
}

//MARK: -Collection View Delegate, flow delegate
extension HorizontalReusableView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        collectionView.reloadData()
        selectedCategory = categories.allCases[indexPath.row]
        delegate?.carCategorySelected(selectedCategory!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 151, height: 161)
    }
}
