//
//  CategoryRepository.swift
//  App
//
//  Created by José João Silva Nunes Alves on 26/05/21.
//

import CoreData

class CategoryRepository: Repository {
    let coreDataService: CoredataService<Category> = CoredataService<Category>()

    func create() -> Category? {
        let category = coreDataService.create()
        category?.selecteds = [Int]()

        _ = coreDataService.save()
        return category
    }

    func read() -> Category? {
        guard let category = coreDataService.read().first else {return nil}

        return category
    }

    func readAll() -> [Category]? {
        return coreDataService.read()
    }

    func addCategory(categoryId: Int) -> Category {
        if let category = self.read() {
            category.selecteds?.append(categoryId)
            _ = coreDataService.save()
            return category
        }
        let newCategory = self.create()
        newCategory?.selecteds = [categoryId]
        _ = coreDataService.save()
        return newCategory!
    }

    func removeCategory(categoryId: Int) -> Category {
        let category = self.read()
        if let index = category?.selecteds?.firstIndex(where: {$0 == categoryId}) {
            category?.selecteds?.remove(at: index)
            _ = coreDataService.save()
        }
        return category!
    }
}
