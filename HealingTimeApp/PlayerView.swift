//
//  PlayerView.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import SwiftUI

struct PlayerView: View {
    @State private var value: Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("15")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.white)
                        
                    }
                    Spacer()
                }
                //title
                Text("1 minute healing time")
                    .font(.title)
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(spacing: 5) {
                    Slider(value: $value, in: 0...60)
                        .accentColor(.white)
                    
                    HStack {
                        Text("0.0")
                        Spacer()
                        Text("1.00")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white)
                
                }
                HStack {
                    //repeat button
                    PlaybackControlButton(systemName: "repeat") {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "gobackward.10") {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "play.circle.fill", fontSize: 44) {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "goforward.10") {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "stop.fill") {
                        
                    }
                }
                
            }
            .padding(20)
        }
    }
}

#Preview {
    PlayerView()
}
