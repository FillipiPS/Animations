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
        WaveView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
