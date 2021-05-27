//
//  DoubleCell.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

enum Axis: Int, CaseIterable {
    case horizontal, vertical
}
struct DoubleCell<Content: View>: View, Identifiable {
    let index: Int
    var id: Int { index }

    let axis: Axis
    let firstContent: Content
    let secondContent: Content

    init(_ index: Int, _ axis: Axis, firstContent: Content, secondContent: Content) {
        self.index = index
        self.axis = axis
        self.firstContent = firstContent
        self.secondContent = secondContent
    }

    var body: some View {
        switch self.axis {
        case .horizontal:
            HStack {
                firstContent
                secondContent
            }
        case .vertical:
            VStack {
                firstContent
                secondContent
            }
        }
    }
}
