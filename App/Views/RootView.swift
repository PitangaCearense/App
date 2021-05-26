//
//  RootView.swift
//  App
//
//  Created by Pedro Sousa on 24/05/21.
//

import SwiftUI

struct RootView: View {

    private let moodBoardView = MoodboardView()

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
                NavigationLink(destination: ContentView()) {
                    Label("Preferences", systemImage: "gear")
                }
                Section(header: Text("Favorites")) {
                    NavigationLink("Favorite 1", destination: ContentView())
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
            NavigationView { ContentView().navigationTitle("Favorites") }
                .tabItem {
                    Label("Favorites", systemImage: "photo.on.rectangle.angled")
                }
            NavigationView { ContentView().navigationTitle("Preferences") }
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
