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
    var items = [CarItems]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveData (carModel: CarModel ) {
        let model = CarItems(context: context)
        model.engine = carModel.engine
        model.name = carModel.name
        model.price = carModel.price
        model.category = carModel.category.rawValue
        
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func fetchItems() {
        do {
            items = try context.fetch(CarItems.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
    }
}




