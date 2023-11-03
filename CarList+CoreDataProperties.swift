//
//  CarList+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 29.10.23.
//
//

import Foundation
import CoreData


extension CarList: CarItemProtocol {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarList> {
        return NSFetchRequest<CarList>(entityName: "CarList")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var engine: String?
    @NSManaged public var category: String?
    
    var imageName: String {
        image ?? ""
    }
    
    var engineType: String {
        engine ?? ""
    }
    
    var priceText: String {
        price ?? ""
    }
    
    var carName: String {
        name ?? ""
    }
    
    var brandName: String {
        category ?? ""
    }
    
    var categorySize: String {
        ""
    }
    

}

extension CarList : Identifiable {

}
