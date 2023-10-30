//
//  PlayerView.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var meditationViewModel: MeditationViewModel
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            //background image
            Image(meditationViewModel.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            //bluring the view
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                HStack {
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.white)
                        
                    }
                    Spacer()
                }
                //title
                Text(meditationViewModel.meditation.title)
                    .font(.title)
                    .foregroundStyle(.white)
                
                Spacer()
                
                if let player = audioManager.player {
                    VStack(spacing: 5) {
                        Slider(value: $value, in: 0...player.duration){
                            editing in
                            print("editing", editing)
                            isEditing = editing
                            
                            if !editing {
                                player.currentTime = value
                            }
                        }
                        .accentColor(.white)
                        
                        HStack {
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "1.00")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        
                    }
                    HStack {
                        //repeat button
                        let color: Color = audioManager.isLooping ? .teal : .white
                        PlaybackControlButton(systemName: "repeat", color : color) {
                            audioManager.toggleLoop()
                        }
                        Spacer()
                        
                        PlaybackControlButton(systemName: "gobackward.10") {
                            player.currentTime -= 10
                        }
                        Spacer()
                        PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                            audioManager.playPause()
                            
                        }
                        Spacer()
                        
                        PlaybackControlButton(systemName: "goforward.10") {
                            player.currentTime += 10
                            
                        }
                        
                        Spacer()
                        PlaybackControlButton(systemName: "stop.fill") {
                            audioManager.stop()
                            dismiss()
                        }
                    }
                }
            }
            .padding(20)
        }
        .onAppear {
//            AudioManager.shared.startPlayer(track: meditationViewModel.meditation.track, isPreview: isPreview)
            audioManager.startPlayer(track: meditationViewModel.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationViewModel = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        PlayerView(meditationViewModel: meditationViewModel, isPreview: true)
            .environmentObject(AudioManager())
        
    }
}
