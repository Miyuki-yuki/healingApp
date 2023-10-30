//
//  ContentView.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MeditationView(meditationViewModel: MeditationViewModel(meditation: Meditation.data))
        }
    
    }


#Preview {
    ContentView()
        .environmentObject(AudioManager())
}
