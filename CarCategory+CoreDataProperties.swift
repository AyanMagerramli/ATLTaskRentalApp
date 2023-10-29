//
//  CarCategory+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 29.10.23.
//
//

import Foundation
import CoreData


extension CarCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarCategory> {
        return NSFetchRequest<CarCategory>(entityName: "CarCategory")
    }

    @NSManaged public var categoryName: String?
    @NSManaged public var categoryImage: String?
    @NSManaged public var categorySize: String?

}

extension CarCategory : Identifiable {

}
