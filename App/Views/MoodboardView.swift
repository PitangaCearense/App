//
//  MoodboardView.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct MoodboardView: View {
    @State private var showAlert = false
    @State private var isFavorite = false

    private var navigationTitle: String
    private var displayMode: NavigationBarItem.TitleDisplayMode

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
        Moodboard(content: { index in
            self.generateRandomCell(for: index)
        })
        .alert(isPresented: self.$showAlert,
               TextAlert(title: "New Favorite", placeholder: "Name",
                         okButtonText: "Save", cancelButtonText: "Cancel",
                         submitHandler: self.saveFavorite, cancelHandler: self.cancel))
        .accentColor(.white)
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(displayMode)
        .toolbar(content: self.createToolBarMenu)
    }

    private func saveFavorite(with name: String?) {
        self.isFavorite = true
        print(name ?? "Empty")
    }

    private func cancel() {
        self.showAlert = false
    }

    private func shoudCallAlert() {
        if self.isFavorite {
            self.isFavorite = false
            print("Unfavorite Moodboard...")
        } else {
            self.showAlert = true
        }
    }

    private func refresh() {
        print("Refresh...")
    }

    @ViewBuilder private func createToolBarMenu() -> some View {
        Menu(content: {
            Button(action: self.shoudCallAlert,
                   label: {
                    self.isFavorite ?
                        Label("UnFavorite", systemImage: "star.slash.fill") :
                        Label("Favorite", systemImage: "star")
            })

            Button(action: self.refresh) {
                Label("Refresh", systemImage: "arrow.counterclockwise")
            }
        }, label: {
            Image(systemName: "ellipsis")
        })
    }

    @ViewBuilder private func contentForCell(at index: Int, itemIndex: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
            Text("\(index) - \(itemIndex)").foregroundColor(.black)
        }
    }

    @ViewBuilder private func generateRandomCell(for index: Int) -> some View {
        switch CellLayout(rawValue: Int.random(in: 0..<4)) {
        case.single:
            SingleCell(index, self.contentForCell)
        case .double:
            DoubleCell(index, .vertical, self.contentForCell)
        case .triple:
            TripleCell(index, .north, self.contentForCell)
        default:
            QuadrupleCell(index, self.contentForCell)
        }
    }
}

struct MoodboardView_Previews: PreviewProvider {
    static var previews: some View {
        MoodboardView()
    }
}
