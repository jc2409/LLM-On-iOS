//
//  llm_on_iosApp.swift
//  llm-on-ios
//
//  Created by Andrew Choi on 28/09/2024.
//

import SwiftUI

@main
struct llm_on_iosApp: App {
    @StateObject private var llmManager = LLMManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(llmManager)
        }
    }
}
