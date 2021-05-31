//
//  CoredataService.swift
//  App
//
//  Created by José João Silva Nunes Alves on 25/05/21.
//

import Foundation
import CoreData

extension NSManagedObject {
    static var entityName: String {
        return String(describing: self)
    }
}

class CoredataService<T: NSManagedObject> {
    let persistentContainer: NSPersistentCloudKitContainer = {
        let container = PersistenceController.shared.container
        return container
    }()

    func create() -> T? {
        guard let entity = NSEntityDescription.entity(forEntityName: T.entityName, in: persistentContainer.viewContext)
        else { return nil }

//        _ = self.save()
        return T(entity: entity, insertInto: persistentContainer.viewContext)
    }

    func read() -> [T] {
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<T>(entityName: T.entityName)

        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            return []
        }
    }

    func delete(object: T) -> T? {
        let context = self.persistentContainer.viewContext
        context.delete(object)

        if self.save() {
            return object
        }
        return nil
    }

    func deleteAll() {
        let context = self.persistentContainer.viewContext
        let results = self.read()

        for item in results {
            context.delete(item)
        }
        _ = self.save()
    }

    func searchFor(predicate: NSPredicate) -> [T]? {
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<T>(entityName: T.entityName)
        fetchRequest.predicate = predicate

        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            return nil
        }
    }

    func save() -> Bool {
        let context = self.persistentContainer.viewContext
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
}
