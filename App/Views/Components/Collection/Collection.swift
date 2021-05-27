//
//  Collection.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct CollectionLayout {
    let itemSize: CGSize
    let spaceBetweenItems: CGFloat
}

struct Collection<Content>: View where Content: View {
    let spacing: CGFloat
    let numberOfItems: Int

    private let screenSize: CGSize = UIScreen.main.bounds.size

    private var items: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 200))
    ]

    let cellForIndex: (Int) -> Content

    init(_ numberOfItems: Int, spacing: CGFloat, cellForIndex: @escaping (Int) -> Content) {
        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.cellForIndex = cellForIndex
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: items, spacing: spacing) {
                ForEach(0..<self.numberOfItems, id: \.self) { index in
                    self.cellForIndex(index)
                        .frame(idealWidth: 190, idealHeight: 190)
                }
            }
        }
    }
}
