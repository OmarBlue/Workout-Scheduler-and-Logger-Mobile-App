//
//  Mobile_App_CourseworkApp.swift
//  Mobile App Coursework
//
//  Created by Omar Aratuc on 15/12/2022.
//

import SwiftUI

@main
struct Mobile_App_CourseworkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
