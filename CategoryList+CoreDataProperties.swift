//
//  CategoryList+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 29.10.23.
//
//

import Foundation
import CoreData


extension CategoryList: CarItemProtocol {
  

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryList> {
        return NSFetchRequest<CategoryList>(entityName: "CategoryList")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var size: String?
    
    var imageName: String {
        image ?? ""
    }
    
    var engineType: String {
        ""
    }
    
    var priceText: String {
        ""
    }
    
    var carName: String {
        ""
    }
    
    var brandName: String {
        name ?? ""
    }
    
    var categorySize: String {
        size ?? ""
    }

}

extension CategoryList : Identifiable {

}
