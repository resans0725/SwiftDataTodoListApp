//
//  SwiftDataTodoAppApp.swift
//  SwiftDataTodoApp
//
//  Created by 永井涼 on 2023/08/05.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
