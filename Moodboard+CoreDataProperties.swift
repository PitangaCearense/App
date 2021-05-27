//
//  Moodboard+CoreDataProperties.swift
//  App
//
//  Created by José João Silva Nunes Alves on 25/05/21.
//
//

import Foundation
import CoreData


extension Moodboard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Moodboard> {
        return NSFetchRequest<Moodboard>(entityName: "Moodboard")
    }

    @NSManaged public var name: String?
    @NSManaged public var favorite: Bool
    @NSManaged public var creationDate: Date?
    @NSManaged public var data: NSObject?
    @NSManaged public var moodboardDay: Bool

}

extension Moodboard : Identifiable {

}
