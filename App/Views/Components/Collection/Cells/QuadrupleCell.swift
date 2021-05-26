//
//  QuadrupleCell.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct QuadrupleCell<Content: View>: View, Identifiable {
    let index: Int
    var id: Int { index }

    let content: (Int, Int) -> Content

    init(_ index: Int,
         @ViewBuilder _ content: @escaping (Int, Int) -> Content) {
        self.index = index
        self.content = content
    }

    var body: some View {
        VStack {
            HStack {
                content(self.index, 0)
                content(self.index, 1)
            }
            HStack {
                content(self.index, 2)
                content(self.index, 3)
            }
        }
    }
}
