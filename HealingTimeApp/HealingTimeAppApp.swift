//
//  HealingTimeAppApp.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import SwiftUI

@main
struct HealingTimeAppApp: App {
    @StateObject var audioManager = AudioManager()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
