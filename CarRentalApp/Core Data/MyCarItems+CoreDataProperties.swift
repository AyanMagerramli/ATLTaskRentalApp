//
//  MyCarItems+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 29.10.23.
//
//

import Foundation
import CoreData


extension MyCarItems: CarItemProtocol {
   
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyCarItems> {
        return NSFetchRequest<MyCarItems>(entityName: "MyCarItems")
    }

    @NSManaged public var name: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var engine: String?
    
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

}

extension MyCarItems : Identifiable {

}
