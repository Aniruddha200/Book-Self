//
//  BookwarmApp.swift
//  Bookwarm
//
//  Created by administrator on 10/07/2021.
//

import SwiftUI

@main
struct BookwarmApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
