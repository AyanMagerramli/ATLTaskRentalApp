//
//  CoredataForCategory.swift
//  CarRentalApp
//
//  Created by Ayan on 29.10.23.
//

import Foundation
import CoreData

class CoredataForCategory {
    
    var context = AppDelegate().persistentContainer.viewContext
    var items = [CategoryList]()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveData (categoryModel: CategoryModel ) {
        let model = CategoryList(context: context)
        model.image = categoryModel.image
        model.name = categoryModel.name
        model.size = categoryModel.size
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
   
    func fetchItems() {
        do {
            items = try context.fetch(CategoryList.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
    }
}




