//
//  VehiclesVC.swift
//  CarRentalApp
//
//  Created by Ayan on 21.10.23.
//

import UIKit

class VehiclesVC: UIViewController {
    @IBOutlet weak var vehiclesTable: UITableView!
    
    
    //    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)
    //    var categories = CarCategory.self
    //    var items = [CarItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehiclesTable.backgroundColor = .systemGray6
        vehiclesTable.dataSource = self
        vehiclesTable.delegate = self
        vehiclesTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        vehiclesTable.register(UINib(nibName: "CarCategoryCell", bundle: nil), forCellReuseIdentifier: "CarCategoryCell")
        
        //updateItems()
        
    }
    //    func updateItems () {
    //        coreData.fetchItems()
    //        items = coreData.items
    //        UserDefaults.standard.setValue(true, forKey: "isDataLoaded")
    //    }
}

//MARK: Table View Data Source
extension VehiclesVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3 //search bar, horizontal car (category), vertical car (car model)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 //only one searchbar
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return UITableViewCell()
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarCategoryCell", for: indexPath) as! CarCategoryCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            return cell
        }
    }
}

//MARK: Table View Delegate
extension VehiclesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            40
        } else if indexPath.section == 1 {
            190
        } else {
            450
        }
    }
}
