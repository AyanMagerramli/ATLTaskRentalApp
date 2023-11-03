//
//  CoreData.swift
//  CarRentalApp
//
//  Created by Ayan on 23.10.23.
//

import Foundation
import CoreData

class CoreData {
    
    var context = AppDelegate().persistentContainer.viewContext
    var items = [CarList]()
    
    var callback: (()-> Void)?
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveData (carModel: CarModel ) {
        let model = CarList(context: context)
        model.category = carModel.category.name
        model.name = carModel.name
        model.engine = carModel.engine
        model.image = carModel.image
        model.price = carModel.price
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
   
    func fetchItems() {
        do {
            items = try context.fetch(CarList.fetchRequest())
            callback?()
        } catch {
            print(error.localizedDescription)
        }
    }
}




