//
//  ProBookwormApp.swift
//  ProBookworm
//
//  Created by Sothesom on 07/11/1402.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceContainer = PersistenceController.shared // <- so need add this line
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext) // <- and here <-
        }
    }
}
