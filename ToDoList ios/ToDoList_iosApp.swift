//
//  ToDoList_iosApp.swift
//  ToDoList ios
//
//  Created by Ismenia Brandao on 2023-01-04.
//

import SwiftUI
import Firebase

@main
struct ToDoList_iosApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}
