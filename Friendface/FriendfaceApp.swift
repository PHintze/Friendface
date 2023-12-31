//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Pascal Hintze on 30.11.2023.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
