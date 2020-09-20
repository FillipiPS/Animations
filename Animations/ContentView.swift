//
//  ContentView.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 09/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            WaveView()
                .tabItem {
                    Image(systemName: K.Symbol.waves)
                    Text("Wave")
                }
            Rotation3DView()
                .tabItem {
                    Image(systemName: K.Symbol.rotation)
                    Text("Rotation 3D")
                }
            FlipCardView()
                .tabItem {
                    Image(systemName: K.Symbol.card)
                    Text("Flip Card")
            }
        }
        .background(Color(K.ColorPalette.background))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
