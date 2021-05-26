//
//  ContentRepository.swift
//  App
//
//  Created by José João Silva Nunes Alves on 25/05/21.
//

import CoreData

class ContentRepository: Repository {
    let coreDataService: CoredataService<Content> = CoredataService<Content>()

    func create(name: String? = nil, author: String? = nil, resource: String? = nil, type: Int16, data: String) -> Content? {

        if let content = self.searchByData(data: data) {
            return content
        }
        let content = coreDataService.create()

        content?.name = name
        content?.author = author
        content?.date = Date()
        content?.resource = resource
        content?.type = type
        content?.data = data

        _ = coreDataService.save()
        return content
    }

    func readAll() -> [Content]? {
        return coreDataService.read()
    }

    func searchBy(ids: [NSManagedObjectID]) -> [Content] {
        var results: [Content] = [Content]()
        var predicate: NSPredicate

        for identifier in ids {
            predicate = NSPredicate(format: "objectID == %@", identifier)
            if let content = coreDataService.searchFor(predicate: predicate)?.first {
                results.append(content)
            }
        }
        return results
    }

    func delete(identifier contents: [NSManagedObjectID]) {
        let contents = self.searchBy(ids: contents)

        for content in contents {
            _ = coreDataService.delete(object: content)
        }
    }

    func searchByData(data: String) -> Content? {
        let predicate = NSPredicate(format: "data == %@", data)

        if let result = self.coreDataService.searchFor(predicate: predicate), result.count > 0 {
            return result.first
        }
        return nil
    }
}
