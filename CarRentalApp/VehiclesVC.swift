//
//  VehiclesVC.swift
//  CarRentalApp
//
//  Created by Ayan on 21.10.23.
//

import UIKit
enum CarCategory {
    case standart
    case prestige
    case Suv
    case econom
}
struct CarModel {
    let price: String
    let name: String
    let engine: String
    let category: CarCategory
}

class VehiclesVC: UIViewController {
    @IBOutlet weak var searchBarField: UISearchBar!
    @IBOutlet weak var vehiclesCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}
extension VehiclesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension VehiclesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}
