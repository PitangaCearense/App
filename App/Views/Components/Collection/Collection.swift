//
//  Collection.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

enum CellLayout: Int {
    case single = 0
    case double = 1
    case triple = 2
    case quadruple = 3
}

struct CollectionLayout {
    let itemSize: CGSize
    let spaceBetweenItems: CGFloat
}

struct Collection<Content>: View where Content: View {
    let layout: CollectionLayout
    let numberOfItems: Int

    let cellForIndex: (Int) -> Content

    init(_ numberOfItems: Int, layout: CollectionLayout, cellForIndex: @escaping (Int) -> Content) {
        self.numberOfItems = numberOfItems
        self.layout = layout
        self.cellForIndex = cellForIndex
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [.init(.adaptive(minimum: self.layout.itemSize.width),
                                      spacing: self.layout.spaceBetweenItems,
                                      alignment: .center)]) {
                ForEach(0..<self.numberOfItems, id: \.self) { index in
                    self.cellForIndex(index)
                        .frame(idealWidth: self.layout.itemSize.width,
                               idealHeight: self.layout.itemSize.width)
                }
            }
        }
    }
}
