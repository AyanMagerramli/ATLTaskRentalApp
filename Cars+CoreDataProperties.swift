//
//  Cars+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 23.10.23.
//
//

import Foundation
import CoreData


extension Cars {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cars> {
        return NSFetchRequest<Cars>(entityName: "Cars")
    }

    @NSManaged public var name: String?
    @NSManaged public var engine: String?
    @NSManaged public var price: String?
    @NSManaged public var category: String?

}

extension Cars : Identifiable {

}
