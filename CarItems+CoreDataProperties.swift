//
//  CarItems+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 29.10.23.
//
//

import Foundation
import CoreData


extension CarItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarItems> {
        return NSFetchRequest<CarItems>(entityName: "CarItems")
    }

    @NSManaged public var category: String?
    @NSManaged public var engine: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?

}

extension CarItems : Identifiable {

}
