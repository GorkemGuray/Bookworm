//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Görkem Güray on 9.07.2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
