//
//  DoubleCell.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct DoubleCell<Content: View>: View, Identifiable {
    enum Axis {
        case horizontal, vertical
    }

    let index: Int
    var id: Int { index }

    let axis: Axis
    let content: (Int, Int) -> Content

    init(_ index: Int, _ axis: Axis,
         @ViewBuilder _ content: @escaping (Int, Int) -> Content) {
        self.index = index
        self.axis = axis
        self.content = content
    }

    var body: some View {
        switch self.axis {
        case .horizontal:
            HStack {
                content(self.index, 0)
                content(self.index, 1)
            }
        case .vertical:
            VStack {
                content(self.index, 0)
                content(self.index, 1)
            }
        }
    }
}
