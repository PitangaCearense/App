//
//  Moodboard.swift
//  App
//
//  Created by Pedro Sousa on 25/05/21.
//

import SwiftUI

struct MoodboardComponent<Content: View>: View {
    let layout: CollectionLayout = CollectionLayout(itemSize: CGSize(width: 390, height: 390),
                                                    spaceBetweenItems: 8)

    let content: (Int) -> Content

    var body: some View {
        Collection(10, layout: layout) { index in
            self.content(index)
        }.padding(.horizontal, 8)
    }
}
