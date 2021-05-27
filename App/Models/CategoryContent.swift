//
//  Categories.swift
//  App
//
//  Created by José João Silva Nunes Alves on 24/05/21.
//

import SwiftUI

enum Categories: Int, CaseIterable {
    case poetry = 0
    case education
    case fashion
    case science
    case computer
    case industry
    case music
    case art
    case sports
    case animals
    case nature
    case health
    case food
    case travel
    case backgrounds
    case people
    case religion
    case feelings
    case buildings
    case places
    case transportation
    case busines

    var category: CategoryContent {
        switch self {
        case .poetry:
            return CategoryContent(name: "Poetry", icon: "pencil", categoryColor: .green)
        case .education:
            return CategoryContent(name: "Education", icon: "graduationcap", categoryColor: .green)
        case .fashion:
            return CategoryContent(name: "Fashion", icon: "sparkles", categoryColor: .green)
        case .science:
            return CategoryContent(name: "Science", icon: "atom", categoryColor: .green)
        case .computer:
            return CategoryContent(name: "Computer", icon: "desktopcomputer", categoryColor: .green)
        case .industry:
            return CategoryContent(name: "Industry", icon: "burst", categoryColor: .green)
        case .music:
            return CategoryContent(name: "Music", icon: "music.note", categoryColor: .purple)
        case .art:
            return CategoryContent(name: "Art", icon: "paintbrush.pointed", categoryColor: .purple)
        case .sports:
            return CategoryContent(name: "Sports", icon: "sportscourt", categoryColor: .purple)
        case .animals:
            return CategoryContent(name: "Animals", icon: "tortoise", categoryColor: .purple)
        case .nature:
            return CategoryContent(name: "Nature", icon: "leaf", categoryColor: .purple)
        case .health:
            return CategoryContent(name: "Health", icon: "heart", categoryColor: .purple)
        case .food:
            return CategoryContent(name: "Food", icon: "cart", categoryColor: .purple)
        case .travel:
            return CategoryContent(name: "Travel", icon: "bus.doubledecker.fill", categoryColor: .purple)
        case .backgrounds:
            return CategoryContent(name: "Backgrounds", icon: "photo", categoryColor: .purple)
        case .people:
            return CategoryContent(name: "People", icon: "person", categoryColor: .blue)
        case .religion:
            return CategoryContent(name: "Religion", icon: "timelapse", categoryColor: .blue)
        case .feelings:
            return CategoryContent(name: "Feelings", icon: "point.topleft.down.curvedto.point.bottomright.up", categoryColor: .blue)
        case .buildings:
            return CategoryContent(name: "Buildings", icon: "building", categoryColor: .blue)
        case .places:
            return CategoryContent(name: "Places", icon: "mappin.and.ellipse", categoryColor: .blue)
        case .transportation:
            return CategoryContent(name: "Transportation", icon: "car", categoryColor: .blue)
        case .busines:
            return CategoryContent(name: "Busines", icon: "signature", categoryColor: .blue)
        }
    }
}

struct CategoryContent: Hashable {
    var name: String
    var icon: String
    var categoryColor: CategoryColor
    var selected: Bool = false

    enum CategoryColor {
        case green
        case purple
        case blue

        var color: Color {
            switch self {
            case .green:
                return Color("greenCategory")
            case .purple:
                return Color("purpleCategory")
            case .blue:
                return Color("blueCategory")
            }
        }
    }
}

extension CategoryContent {
    static let allCategories: [CategoryContent] = [
        CategoryContent(name: "Poetry", icon: "pencil", categoryColor: .green),
        CategoryContent(name: "Education", icon: "graduationcap", categoryColor: .green),
        CategoryContent(name: "Fashion", icon: "sparkles", categoryColor: .green),
        CategoryContent(name: "Science", icon: "atom", categoryColor: .green),
        CategoryContent(name: "Computer", icon: "desktopcomputer", categoryColor: .green),
        CategoryContent(name: "Industry", icon: "burst", categoryColor: .green),

        CategoryContent(name: "Music", icon: "music.note", categoryColor: .purple),
        CategoryContent(name: "Art", icon: "paintbrush.pointed", categoryColor: .purple),
        CategoryContent(name: "Sports", icon: "sportscourt", categoryColor: .purple),
        CategoryContent(name: "Animals", icon: "tortoise", categoryColor: .purple),
        CategoryContent(name: "Nature", icon: "leaf", categoryColor: .purple),
        CategoryContent(name: "Health", icon: "heart", categoryColor: .purple),
        CategoryContent(name: "Food", icon: "cart", categoryColor: .purple),
        CategoryContent(name: "Travel", icon: "bus.doubledecker.fill", categoryColor: .purple),
        CategoryContent(name: "Backgrounds", icon: "photo", categoryColor: .purple),

        CategoryContent(name: "People", icon: "person", categoryColor: .blue),
        CategoryContent(name: "Religion", icon: "timelapse", categoryColor: .blue),
        CategoryContent(name: "Feelings", icon: "point.topleft.down.curvedto.point.bottomright.up", categoryColor: .blue),
        CategoryContent(name: "Buildings", icon: "building", categoryColor: .blue),
        CategoryContent(name: "Places", icon: "mappin.and.ellipse", categoryColor: .blue),
        CategoryContent(name: "Transportation", icon: "car", categoryColor: .blue),
        CategoryContent(name: "Busines", icon: "signature", categoryColor: .blue)
    ]
}
