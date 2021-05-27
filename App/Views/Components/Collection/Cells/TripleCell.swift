//
//  TripleCell.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

enum Direction: Int, CaseIterable {
    case north, east, south, west
}

struct TripleCell<Content: View>: View, Identifiable {
    let index: Int
    var id: Int { index }

    let direction: Direction

    let firstContent: Content
    let secondContent: Content
    let thirdContent: Content

    init(_ index: Int, _ direction: Direction,
         firstContent: Content, secondContent: Content, thirdContent: Content) {
        self.index = index
        self.direction = direction
        self.firstContent = firstContent
        self.secondContent = secondContent
        self.thirdContent = thirdContent
    }

    var body: some View {
        switch self.direction {
        case .north:
            VStack {
                HStack {
                    firstContent
                    secondContent
                }
                thirdContent
            }
        case .east:
            HStack {
                VStack {
                    firstContent
                    secondContent
                }
                thirdContent
            }
        case .south:
            VStack {
                firstContent
                HStack {
                    secondContent
                    thirdContent
                }
            }
        case .west:
            HStack {
                firstContent
                VStack {
                    secondContent
                    thirdContent
                }
            }
        }
    }
}
