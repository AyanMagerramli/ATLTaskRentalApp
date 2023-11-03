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
    var items = [CarList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehiclesCollectionView.dataSource = self
        vehiclesCollectionView.delegate = self
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = UIColor.white
        searchView.layer.cornerRadius = 30
        vehiclesCollectionView.backgroundColor = .none
        updateItems()
        configureUI()
        
    }
    
    func configureUI () {
        vehiclesCollectionView.register(UINib(nibName: "\(CollectionCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CollectionCell.self)")
        vehiclesCollectionView.register(UINib(nibName: "HorizontalReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HorizontalReusableView")
    }
    
    //MARK: - Search Text Field implementation
    @IBAction func searchAction(_ sender: Any) {
        print("\(String(describing: searchTextField.text))")
        vehiclesCollectionView.reloadData()
        if let searchText = searchTextField.text {
            if searchText.isEmpty {
                items = coreData.items
            } else {
                items = coreData.items.filter { carItem in
                    return (carItem.name?.lowercased() ?? "").contains(searchText.lowercased()) ||
                    (carItem.category?.lowercased() ?? "").contains(searchText.lowercased())
                }
            }
        }
    }
    func updateItems () {
        coreData.fetchItems()
        items = coreData.items
        print("this is core data items\(coreData.items)")
        UserDefaults.standard.setValue(true, forKey: "isDataLoaded")
    }
}

//MARK: -Callback for category selection
extension VehiclesVC: CarCategoryCellDelegate {
    func carCategorySelected(_ category: CategoryList) {
        let filteredItems = coreData.items.filter { $0.category?.lowercased() == category.name?.lowercased()}
        
        DispatchQueue.main.async {
            self.items = filteredItems
            self.vehiclesCollectionView.reloadData()
        }
    }
}

//MARK: -Collection View Data Source
extension VehiclesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionCell.self)", for: indexPath) as! CollectionCell
        cell.layer.cornerRadius = 35
        cell.configureCarCell(data: items[indexPath.row])
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


