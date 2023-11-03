//
//  HorizontalReusableView.swift
//  CarRentalApp
//
//  Created by Ayan on 28.10.23.
//

import UIKit

//MARK: Delegate for Car Category selection
protocol CarCategoryCellDelegate {
    func carCategorySelected (_ category: CategoryList)
}

class HorizontalReusableView: UICollectionReusableView {

    @IBOutlet weak var horizontalCollection: UICollectionView!
    
    let coredataForCategories = CoredataForCategory(context: AppDelegate().persistentContainer.viewContext)
   // var categories = [CategoryList]()
    var selectedCategory: CategoryList?
    var delegate: CarCategoryCellDelegate?
    var selectedIndex: IndexPath?
    var viewModel: HorizontalViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
       // print("MY CATEGORIEEEEEEEEESS \(categories)")
        viewModel = HorizontalViewModel(coreData: coredataForCategories)
        updateCategories()
        viewModel.callback = {[weak self] in
            self?.horizontalCollection.reloadData()
        }
    }
    
    func configureUI () {
        horizontalCollection.dataSource = self
        horizontalCollection.delegate = self
        horizontalCollection.register(UINib(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionCell")
    }
    
    func updateCategories () {
        viewModel.fetchItems()
    }
}

//MARK: -Collection View Data Source
extension HorizontalReusableView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionCell",
            for: indexPath
        ) as! CategoryCollectionCell
        cell.configureCarCell(data:  viewModel.categories[indexPath.row])
        cell.layer.cornerRadius = 15
//        let categoryCount = items.filter{$0.category?.lowercased() == category.rawValue}.count
        //in order to change background color into blue
        //and text colors into white
        if indexPath == selectedIndex{
            cell.configureUIWhenChoosed()
        } else {
            cell.configureUIWhenUnChoosed()
        }
        return cell
    }
}

//MARK: -Collection View Delegate, flow delegate
extension HorizontalReusableView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        collectionView.reloadData()
        selectedCategory = viewModel.categories[indexPath.row]
        print("Selected CATEH+GORY ISS: \(selectedCategory)")
        delegate?.carCategorySelected(selectedCategory!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 151, height: 161)
    }
}


