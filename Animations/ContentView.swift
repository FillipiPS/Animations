//
//  ContentView.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 09/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var axis = (CGFloat(0), CGFloat(0), CGFloat(1))
    @State private var counter = 0
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
                
        VStack {
//            WaveView()
            Text("Rotation 3D Animation")
                .font(.largeTitle)
            Spacer()
            Circle()
                .overlay(
                    Image(systemName: "ant")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    )
                .frame(width: 100.0, height: 100.0)
                .onReceive(timer) { time in
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 2)) {
                        self.animationAmount += 360
                        self.counter += 1
                        if self.counter % 2 == 0 { // In rotation3DEffect gets double axis, it is not a bug, it`s a feature
                            self.axis = self.changeAxis(for: self.axis)
                        }
                    }
                }
            .rotation3DEffect(.degrees(animationAmount), axis: (x: axis.0, y: axis.1, z: axis.2))
            Spacer()
        }
        .onDisappear() { self.timer.upstream.connect().cancel() }
    }
    
    // Change the states of axis (0,0,1) -> (1,0,0) -> (0,1,0) -> (0,0,1)
    func changeAxis(for axis: (CGFloat, CGFloat, CGFloat)) -> (CGFloat, CGFloat, CGFloat) {
        switch axis {
        case (0,0,1):
            return (1,0,0)
        case (1,0,0):
            return (0,1,0)
        default:
            return (0,0,1)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
