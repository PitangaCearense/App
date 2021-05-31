//
//  RootView.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct RootView: View {

    private let moodBoardView = MoodboardView()
    private let preferencesView = PreferencesView()

    init() {
//        UINavigationBar.appearance().barTintColor = .black
//        UINavigationBar.appearance().backgroundColor = .black
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//        UITabBar.appearance().backgroundColor = .black
    }

    var body: some View {
        configure()
            .accentColor(Color.white)
            .preferredColorScheme(.dark)
    }

    private func configure() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(createTabBar())
        }

        return AnyView(createSideBar())
    }

    private func createSideBar() -> some View {
        NavigationView {
            List {
                NavigationLink(destination: self.moodBoardView) {
                    Label("Moodboard of the Day", systemImage: "square.grid.2x2")
                }
                NavigationLink(destination: self.preferencesView) {
                    Label("Preferences", systemImage: "gear")
                }
                Section(header: Text("Favorites")) {
                    NavigationLink("All Favorites", destination: FavoritesView())
                    NavigationLink("Favorite 2", destination: ContentView())
                    NavigationLink("Favorite 3", destination: ContentView())
                }
            }
            .accentColor(Color(.systemGray2))
            .listStyle(SidebarListStyle())
            .navigationTitle("Moodboard")

            self.moodBoardView
        }
    }

    private func createTabBar() -> some View {
        TabView {
            NavigationView { moodBoardView.navigationTitle("Moodboard") }
                .tabItem {
                    Label("Moodboard", systemImage: "square.grid.2x2")
                }
            NavigationView { FavoritesView().navigationTitle("Favorites") }
                .tabItem {
                    Label("Favorites", systemImage: "photo.on.rectangle.angled")
                }
            NavigationView { self.preferencesView.navigationTitle("Preferences") }
                .tabItem {
                    Label("Preferences", systemImage: "gear")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
