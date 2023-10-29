//
//  MeditationView.swift
//  HealingTimeApp
//
//  Created by Miyuki Kikuchi on 29/10/2023.
//

import SwiftUI

struct MeditationView: View {
    @State private var showPlayer = false
    
    var body: some View {
        VStack(spacing: -20) {
            Image("5")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 2)
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Music")
                        
                        Text("0s")
                        
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    //Title
                    Text("1 minute healing time")
                    
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
                    Text("Close your eyes and clear your mind. Then, breathe slowly.")
                    
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView()
        }
    }
}

#Preview {
    MeditationView()
}
