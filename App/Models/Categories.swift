//
//  Categories.swift
//  App
//
//  Created by José João Silva Nunes Alves on 24/05/21.
//

import SwiftUI

struct Category: Hashable {
    var name: String
    var icon: String
    var categoryColor: CategoryColor

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

extension Category {
    static let allCategories: [Category] = [
        Category(name: "Poetry", icon: "pencil", categoryColor: .green),
        Category(name: "Education", icon: "graduationcap", categoryColor: .green),
        Category(name: "Fashion", icon: "sparkles", categoryColor: .green),
        Category(name: "Science", icon: "atom", categoryColor: .green),
        Category(name: "Computer", icon: "desktopcomputer", categoryColor: .green),
        Category(name: "Industry", icon: "burst", categoryColor: .green),

        Category(name: "Music", icon: "music.note", categoryColor: .purple),
        Category(name: "Art", icon: "paintbrush.pointed", categoryColor: .purple),
        Category(name: "Sports", icon: "sportscourt", categoryColor: .purple),
        Category(name: "Animals", icon: "tortoise", categoryColor: .purple),
        Category(name: "Nature", icon: "leaf", categoryColor: .purple),
        Category(name: "Health", icon: "heart", categoryColor: .purple),
        Category(name: "Food", icon: "cart", categoryColor: .purple),
        Category(name: "Travel", icon: "bus.doubledecker.fill", categoryColor: .purple),
        Category(name: "Backgrounds", icon: "photo", categoryColor: .purple),

        Category(name: "People", icon: "person", categoryColor: .blue),
        Category(name: "Religion", icon: "timelapse", categoryColor: .blue),
        Category(name: "Feelings", icon: "point.topleft.down.curvedto.point.bottomright.up", categoryColor: .blue),
        Category(name: "Buildings", icon: "building", categoryColor: .blue),
        Category(name: "Places", icon: "mappin.and.ellipse", categoryColor: .blue),
        Category(name: "Transportation", icon: "car", categoryColor: .blue),
        Category(name: "Busines", icon: "signature", categoryColor: .blue)
    ]
}
