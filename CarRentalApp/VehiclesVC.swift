//
//  VehiclesVC.swift
//  CarRentalApp
//
//  Created by Ayan on 21.10.23.
//

import UIKit

class VehiclesVC: UIViewController {
    @IBOutlet weak var searchBarField: UISearchBar!
    @IBOutlet weak var vehiclesCollection: UICollectionView!
    
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    var categories = CarCategory.self
    var items = [CarItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehiclesCollection.dataSource = self
        vehiclesCollection.delegate = self
        vehiclesCollection.register(UINib(nibName: "HorizontalVehiclesCell", bundle: nil), forCellWithReuseIdentifier: "HorizontalVehiclesCell")
        vehiclesCollection.register(UINib(nibName: "VerticalVehiclesCell", bundle: nil), forCellWithReuseIdentifier: "VerticalVehiclesCell")
        updateItems()
   
    }
    func updateItems () {
        coreData.fetchItems()
        items = coreData.items
        UserDefaults.standard.setValue(true, forKey: "isDataLoaded")
    }
}
extension VehiclesVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categories.allCases.count
        }
        if section == 1 {
            return items.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalVehiclesCell", for: indexPath) as! HorizontalVehiclesCell
            let category = categories.allCases[indexPath.row]
            cell.categoryLabel.text = String(describing: category)
            let categoryCount: Int
            switch category {
            case .Suv:
                categoryCount = items.filter{$0.category == "Suv"}.count
            case .econom:
                categoryCount = items.filter{$0.category == "Econom"}.count
            case .prestige:
                categoryCount = items.filter{$0.category == "Prestige"}.count
            case .standart:
                categoryCount = items.filter{$0.category == "Standart"}.count
            }
            cell.itemsPerCategorLabel.text = String(categoryCount)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalVehiclesCell", for: indexPath) as! VerticalVehiclesCell
            cell.carPriceLabel.text = items[indexPath.row].price
            cell.carModelLabel.text = items[indexPath.row].name
            cell.engineLabel.text = items[indexPath.row].engine
            cell.carBrandLabel.text = items[indexPath.row].category
            return cell
        }
    }
}

extension VehiclesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

extension VehiclesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3)
                } else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/2)
        }
    }
}
