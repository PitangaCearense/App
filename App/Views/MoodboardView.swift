//
//  MoodboardView.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct MoodboardView: View {
    private var navigationTitle: String
    private var displayMode: NavigationBarItem.TitleDisplayMode

    @ObservedObject var viewModel: MoodboardViewModel = MoodboardViewModel()

    init() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.displayMode = .automatic
            self.navigationTitle = "Moodboard"
        } else {
            self.displayMode = .inline
            self.navigationTitle = "Moodboard of the Day"
        }
    }

    var body: some View {
        Collection(viewModel.contentsDataSource.count, spacing: 8) { index in
            self.createCell(for: index)
        }
        .padding(.horizontal, 8)
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(displayMode)
        .toolbar(content: self.createToolBarMenu)
    }
    

    private func refresh() {
        self.viewModel.refreshMoodBoard()
    }

    @ViewBuilder private func createToolBarMenu() -> some View {
        Button(action: self.refresh) {
            Label("Refresh", systemImage: "arrow.counterclockwise")
        }
    }

    private func createCell(for index: Int) -> some View {
        return self.viewModel.contentsDataSource[index]
    }
}

struct MoodboardView_Previews: PreviewProvider {
    static var previews: some View {
        MoodboardView()
    }
}
