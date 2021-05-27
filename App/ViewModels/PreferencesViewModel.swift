//
//  PreferencesViewModel.swift
//  App
//
//  Created by José João Silva Nunes Alves on 26/05/21.
//

import Foundation

class PreferencesViewModel {
    private let repository: CategoryRepository = CategoryRepository()
    private var allCategories: [CategoryContent] = [CategoryContent]()

    func getAllCategories() -> [CategoryContent] {
        var selectedIds: [Int] = []

        if let selectedCategories = repository.read(), let categoriesIds = selectedCategories.selecteds {
            selectedIds = categoriesIds
        }

        Categories.allCases.forEach { category in
            allCategories.append(category.category)
        }

        selectedIds.forEach { identifier in
            allCategories[identifier].selected = true
        }
        return allCategories
    }

    func wasTapped(state: Bool, name: String) {
        let tappedCategory = allCategories.filter { category in
            category.name == name
        }

        if let index = allCategories.firstIndex(where: {$0 == tappedCategory[0]}) {
            if state {
                _ = repository.addCategory(categoryId: index)
            } else {
                _ = repository.removeCategory(categoryId: index)
            }
        }
    }
}
