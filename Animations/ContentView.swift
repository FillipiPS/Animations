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
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Wave")
                }
            Rotation3DView()
                .tabItem {
                    Image(systemName: "goforward")
                    Text("Rotation 3D")
                }
        }
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
