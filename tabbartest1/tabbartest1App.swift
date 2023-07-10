//
//  tabbartest1App.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/9/23.
//

import SwiftUI

@main
struct tabbartest1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
