//
//  PlaybackControlButton.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import SwiftUI

struct PlaybackControlButton: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size:fontSize))
                .foregroundStyle(color)
        }
    }
}

#Preview {
    PlaybackControlButton(action: {})
        .preferredColorScheme(.dark)
}
