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

    let firstContent: Content
    let secondContent: Content
    let thirdContent: Content
    let fourthContent: Content

    init(_ index: Int,
         firstContent: Content, secondContent: Content,
         thirdContent: Content, fourthContent: Content) {
        self.index = index
        self.firstContent = firstContent
        self.secondContent = secondContent
        self.thirdContent = thirdContent
        self.fourthContent = thirdContent
    }

    var body: some View {
        VStack {
            HStack {
                firstContent
                secondContent
            }
            HStack {
                thirdContent
                fourthContent
            }
        }
    }
}
