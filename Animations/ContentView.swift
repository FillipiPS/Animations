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
            WaveView()
            Rotation3DView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
