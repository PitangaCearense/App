//
//  AppApp.swift
//  App
//
//  Created by José João Silva Nunes Alves on 21/05/21.
//

import SwiftUI

@main
struct AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            Text("Hello App")
            SwiftUIView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
