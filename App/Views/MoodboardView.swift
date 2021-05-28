//
//  MoodboardView.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct MoodboardView: View {

    @State private var showErrorAlert = false
    @State private var showSheet = false
    @State private var isFavorite = false
    @State private var favoriteName: String = ""

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
        .sheet(isPresented: $showSheet, content: self.sheetView)
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Ops!"),
                message: Text("Something went wrong :("),
                dismissButton: .default(Text("Ok"), action: { self.showErrorAlert = false })
            )
        }
    }

    @ViewBuilder private func createToolBarMenu() -> some View {
            Menu(content: {
                Button(action: self.shoudCallAlert,
                       label: {
                        self.isFavorite ?
                            Label("Unfavorite", systemImage: "star.slash.fill") :
                            Label("Favorite", systemImage: "star")
                })

                Button(action: self.refresh) {
                    Label("Refresh", systemImage: "arrow.counterclockwise")
                }
            }, label: {
                Image(systemName: "ellipsis")
            })
        }

        private func sheetView() -> some View {
            NavigationView {
                VStack {
                    HStack {
                        Text("Name")
                        TextField("", text: $favoriteName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding()

                    Spacer()
                }
                .navigationTitle("New Favorite")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: Button(action: dismiss, label: { Text("Cancel") }),
                    trailing: Button(action: saveFavorite, label: { Text("Save") })
                )
            }
            .accentColor(.white)
            .preferredColorScheme(.dark)
        }

        private func saveFavorite() {
            self.dismiss()
            if self.viewModel.favoriteMoodboard(with: self.favoriteName) {
                self.isFavorite = true
            } else {
                self.showErrorAlert = true
            }
        }

        private func dismiss() {
            self.showSheet = false
        }

        private func shoudCallAlert() {
            if self.isFavorite {
                if self.viewModel.unfavoriteMoodBoard() {
                    self.isFavorite = false
                } else {
                    self.showErrorAlert = true
                }
            } else {
                self.showSheet = true
            }
        }

    private func refresh() {
        self.viewModel.refreshMoodBoard()
    }

//    @ViewBuilder private func createToolBarMenu() -> some View {
//        Button(action: self.refresh) {
//            Label("Refresh", systemImage: "arrow.counterclockwise")
//        }
//    }

    private func createCell(for index: Int) -> some View {
        return self.viewModel.contentsDataSource[index]
    }
}

struct MoodboardView_Previews: PreviewProvider {
    static var previews: some View {
        MoodboardView()
    }
}
