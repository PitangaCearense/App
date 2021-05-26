//
//  TripleCell.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct TripleCell<Content: View>: View, Identifiable {
    enum Direction {
        case north, east, south, west
    }

    let index: Int
    var id: Int { index }

    let direction: Direction
    let content: (Int, Int) -> Content

    init(_ index: Int, _ direction: Direction,
         @ViewBuilder _ content: @escaping (Int, Int) -> Content) {
        self.index = index
        self.direction = direction
        self.content = content
    }

    var body: some View {
        switch self.direction {
        case .north:
            VStack {
                HStack {
                    content(self.index, 0)
                    content(self.index, 1)
                }
                content(self.index, 2)
            }
        case .east:
            HStack {
                VStack {
                    content(self.index, 0)
                    content(self.index, 1)
                }
                content(self.index, 2)
            }
        case .south:
            VStack {
                content(self.index, 0)
                HStack {
                    content(self.index, 1)
                    content(self.index, 2)
                }
            }
        case .west:
            HStack {
                content(self.index, 0)
                VStack {
                    content(self.index, 1)
                    content(self.index, 2)
                }
            }
        }
    }
}
