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

    private var items: [GridItem]
    private var idealSize: CGSize

    let cellForIndex: (Int) -> Content

    init(_ numberOfItems: Int, spacing: CGFloat, cellForIndex: @escaping (Int) -> Content) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.items = [GridItem(.adaptive(minimum: 150, maximum: 200))]
            self.idealSize = CGSize(width: 150, height: 150)
        } else {
            self.items = [GridItem(.adaptive(minimum: 300, maximum: 400))]
            self.idealSize = CGSize(width: 300, height: 300)
        }

        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.cellForIndex = cellForIndex
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: items, spacing: spacing) {
                ForEach(0..<self.numberOfItems, id: \.self) { index in
                    self.cellForIndex(index)
                        .frame(idealWidth: idealSize.width, idealHeight: idealSize.height)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
    }
}
