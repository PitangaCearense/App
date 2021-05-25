//
//  PreferencesView.swift
//  App
//
//  Created by José João Silva Nunes Alves on 24/05/21.
//

import SwiftUI

struct PreferencesView: View {

    let columns = [
        GridItem(.adaptive(minimum: 90), spacing: 35)
    ]

    var body: some View {

        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(Category.allCategories.shuffled(), id: \.self) { category in
                    CustomButtonView(label: category.name,
                                     icon: category.icon,
                                     color: category.categoryColor.color)
                        .padding(12)
                }
            }
            .padding()
        }
        .background(Color("backgorundColor"))
        .navigationTitle("Preferences")
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PreferencesView()
        }
    }
}
