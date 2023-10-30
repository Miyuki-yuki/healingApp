//
//  MeditationView.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import SwiftUI

struct MeditationView: View {
    @StateObject var meditationViewModel: MeditationViewModel
    @State private var showPlayer = false
    
    var body: some View {
        VStack(spacing: -50) {
            Image(meditationViewModel.meditation.image)
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 1.25)
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Music")
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: meditationViewModel.meditation.duration) ?? meditationViewModel.meditation.duration.formatted() + "S")
                        
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    //Title
                    Text(meditationViewModel.meditation.title)
                    
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                            
                    }
                    //add the description
                    Text(meditationViewModel.meditation.description)
                    
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationViewModel: meditationViewModel)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static let meditationViewModel = MeditationViewModel(meditation:  Meditation.data)
    static var previews: some View {
        MeditationView(meditationViewModel: meditationViewModel)
            .environmentObject(AudioManager())
    }
}
