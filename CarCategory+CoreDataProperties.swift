//
//  CarCategory+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Ayan on 22.10.23.
//
//

import Foundation
import CoreData


extension CarCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarCategory> {
        return NSFetchRequest<CarCategory>(entityName: "CarCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var size: String?

}

extension CarCategory : Identifiable {

}
