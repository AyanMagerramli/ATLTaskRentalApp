//
//  VehiclesVC.swift
//  CarRentalApp
//
//  Created by Ayan on 21.10.23.
//

import UIKit

class VehiclesVC: UIViewController {
    
    @IBOutlet weak var vehiclesCollectionView: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var viewModel: VehiclesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel = VehiclesViewModel(coreData: coreData)
        viewModel.itemsDidChange = { [weak self] in
            self?.vehiclesCollectionView.reloadData()
        }
        updateItems()
    }
    
    func configureUI () {
        vehiclesCollectionView.dataSource = self
        vehiclesCollectionView.delegate = self
        vehiclesCollectionView.register(UINib(nibName: "\(CollectionCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CollectionCell.self)")
        vehiclesCollectionView.register(UINib(nibName: "HorizontalReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HorizontalReusableView")
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = UIColor.white
        searchView.layer.cornerRadius = 30
        vehiclesCollectionView.backgroundColor = .none
    }
    
    //MARK: - Search Text Field implementation
    @IBAction func searchAction(_ sender: Any) {
        if let searchText = searchTextField.text {
            viewModel.filterItems(with: searchText)
        }
    }
    
    func updateItems () {
        viewModel.fetchItems()
        UserDefaults.standard.setValue(true, forKey: "isDataLoaded")
    }
}

//MARK: -Callback for category selection
extension VehiclesVC: CarCategoryCellDelegate {
    func carCategorySelected(_ category: CategoryList) {
        let filteredItems = coreData.items.filter { $0.category?.lowercased() == category.name?.lowercased()}
        
        DispatchQueue.main.async {
            self.viewModel.items = filteredItems
            self.vehiclesCollectionView.reloadData()
        }
    }
}

//MARK: -Collection View Data Source
extension VehiclesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionCell.self)", for: indexPath) as! CollectionCell
        cell.layer.cornerRadius = 35
        cell.configureCarCell(data:  viewModel.items[indexPath.row])
        return cell
    }
}

//MARK: -Collection View Data Source
extension VehiclesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//MARK: -Collection View Delegate Flow Layout
extension VehiclesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width*0.855, height: 340)
    }
    
    //distance between header view and collection cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    //MARK: -Reusable (header or footer) view configuration
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HorizontalReusableView.self)", for: indexPath) as! HorizontalReusableView
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 181)
    }
}


