//
//  WaveView.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 10/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct WaveView: View {
    @State private var animationAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            Text(K.waveViewTitle)
                .font(.largeTitle)
            Spacer()
            Circle()
                .frame(width: 100.0, height: 100.0)
                .overlay(
                    Circle()
                        .stroke(Color(K.ColorPalette.item))
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                )
                .onAppear() {
                    self.animationAmount = 2
                }
                .onDisappear() {
                    self.animationAmount = 0
                }
            Spacer()
        }
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WaveView()
                .environment(\.colorScheme, .light)
            WaveView()
                .environment(\.colorScheme, .dark)
        }
    }
}
