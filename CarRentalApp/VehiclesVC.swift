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
    }
}
extension VehiclesVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }
        if section == 1 {
            return items.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalVehiclesCell", for: indexPath) as! HorizontalVehiclesCell
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
