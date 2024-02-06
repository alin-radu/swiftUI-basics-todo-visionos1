//
//  ToDo_visionos1App.swift
//  ToDo-visionos1
//
//  Created by Alin RADU on 06.02.2024.
//

import SwiftUI
import SwiftData

@main
struct ToDo_visionos1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:TodoList.self)
    }
}
