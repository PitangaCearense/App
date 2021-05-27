//
//  Moodboard+CoreDataProperties.swift
//  App
//
//  Created by Pedro Sousa on 27/05/21.
//
//

import Foundation
import CoreData


extension Moodboard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Moodboard> {
        return NSFetchRequest<Moodboard>(entityName: "Moodboard")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var data: [NSManagedObjectID]?
    @NSManaged public var favorite: Bool
    @NSManaged public var moodboardDay: Bool
    @NSManaged public var name: String?

}

extension Moodboard : Identifiable {

}
