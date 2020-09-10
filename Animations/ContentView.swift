//
//  ContentView.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 09/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Wave Animation")
                .font(.largeTitle)
            Spacer()
            Circle()
                .frame(width: 100.0, height: 100.0)
                .overlay(
                    Circle()
                        .stroke(Color.black)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                )
                .onAppear {
                    self.animationAmount = 2
                }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
