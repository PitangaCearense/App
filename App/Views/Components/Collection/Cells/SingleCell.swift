//
//  SingleCell.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct SingleCell<Content: View>: View, Identifiable {
    let index: Int
    var id: Int { index }

    let content: Content

    init(_ index: Int, content: Content) {
        self.index = index
        self.content = content
    }

    var body: some View {
        content
    }
}
