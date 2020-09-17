//
//  Rotation3DView.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 11/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct Rotation3DView: View {
    @State private var animationAmount = 0.0
    @State private var axis = (CGFloat(0), CGFloat(0), CGFloat(0))
    @State private var counter = 0
    @State private var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(K.rotation3DViewTitle)
                .font(.largeTitle)
            Spacer()
            Circle()
                .foregroundColor(Color("ItemColor"))
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .mask(SymbolView(symbol: K.Symbol.ant))
                )
                .frame(width: 100.0, height: 100.0)
                .onReceive(timer) { time in
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 2)) {
                        self.animationAmount += 360
                        self.counter += 1
                        if self.counter % 2 == 0 { // In rotation3DEffect gets double axis, it is not a bug, it`s a feature
                            self.changeAxis()
                        }
                    }
                }
            .rotation3DEffect(.degrees(animationAmount), axis: (x: axis.0, y: axis.1, z: axis.2))
            Spacer()
        }
        .onAppear() {
            self.timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
            self.counter = 0
            self.animationAmount = 0.0
            self.axis = (CGFloat(0), CGFloat(0), CGFloat(1))
        }
        .onDisappear() {
            self.timer.upstream.connect().cancel()
        }
    }
    
    // Change the states of axis (0,0,1) -> (1,0,0) -> (0,1,0) -> (0,0,1)
    func changeAxis() {
        switch axis {
        case (0,0,1): // Z to X
            axis = (1,0,0)
        case (1,0,0): // X to Y
            axis = (0,1,0)
        default: // Y to Z
            axis = (0,0,1)
        }
    }
}

struct Rotation3DView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Rotation3DView()
                .environment(\.colorScheme, .light)
            Rotation3DView()
                .environment(\.colorScheme, .dark)
        }
    }
}
