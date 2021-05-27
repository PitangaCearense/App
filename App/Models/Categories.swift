//
//  Categories.swift
//  App
//
//  Created by José João Silva Nunes Alves on 24/05/21.
// swiftlint:disable identifier_name

import SwiftUI

enum Categories: Int, CaseIterable {
    case Poetry = 0
    case Education
    case Fashion
    case Science
    case Computer
    case Industry
    case Music
    case Art
    case Sports
    case Animals
    case Nature
    case Health
    case Food
    case Travel
    case Backgrounds
    case People
    case Religion
    case Feelings
    case Buildings
    case Places
    case Transportation
    case Busines
    
    var category: CategoryContent {
        switch self {
        case .Poetry:
            return CategoryContent(name: "Poetry", icon: "pencil", categoryColor: .green)
        case .Education:
            return CategoryContent(name: "Education", icon: "graduationcap", categoryColor: .green)
        case .Fashion:
            return CategoryContent(name: "Fashion", icon: "sparkles", categoryColor: .green)
        case .Science:
            return CategoryContent(name: "Science", icon: "atom", categoryColor: .green)
        case .Computer:
            return CategoryContent(name: "Computer", icon: "desktopcomputer", categoryColor: .green)
        case .Industry:
            return CategoryContent(name: "Industry", icon: "burst", categoryColor: .green)
        case .Music:
            return CategoryContent(name: "Music", icon: "music.note", categoryColor: .purple)
        case .Art:
            return CategoryContent(name: "Art", icon: "paintbrush.pointed", categoryColor: .purple)
        case .Sports:
            return CategoryContent(name: "Sports", icon: "sportscourt", categoryColor: .purple)
        case .Animals:
            return CategoryContent(name: "Animals", icon: "tortoise", categoryColor: .purple)
        case .Nature:
            return CategoryContent(name: "Nature", icon: "leaf", categoryColor: .purple)
        case .Health:
            return CategoryContent(name: "Health", icon: "heart", categoryColor: .purple)
        case .Food:
            return CategoryContent(name: "Food", icon: "cart", categoryColor: .purple)
        case .Travel:
            return CategoryContent(name: "Travel", icon: "bus.doubledecker.fill", categoryColor: .purple)
        case .Backgrounds:
            return CategoryContent(name: "Backgrounds", icon: "photo", categoryColor: .purple)
        case .People:
            return CategoryContent(name: "People", icon: "person", categoryColor: .blue)
        case .Religion:
            return CategoryContent(name: "Religion", icon: "timelapse", categoryColor: .blue)
        case .Feelings:
            return CategoryContent(name: "Feelings", icon: "point.topleft.down.curvedto.point.bottomright.up", categoryColor: .blue)
        case .Buildings:
            return CategoryContent(name: "Buildings", icon: "building", categoryColor: .blue)
        case .Places:
            return CategoryContent(name: "Places", icon: "mappin.and.ellipse", categoryColor: .blue)
        case .Transportation:
            return CategoryContent(name: "Transportation", icon: "car", categoryColor: .blue)
        case .Busines:
            return CategoryContent(name: "Busines", icon: "signature", categoryColor: .blue)
        }
    }
}

struct CategoryContent: Hashable {
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
