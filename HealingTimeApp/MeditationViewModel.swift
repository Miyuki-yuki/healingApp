//
//  MeditationViewModel.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 minute healing time", description: "Close your eyes and clear your mind. Then, breathe slowly.", duration: 70, track: "meditationMusic", image: "15")
    
    
}
