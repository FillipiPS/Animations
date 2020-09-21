//
//  Constants.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 16/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import Foundation
import SwiftUI

struct K {
    static let waveViewTitle = "Wave Animation"
    static let rotation3DViewTitle = "Rotation 3D Animation"
    static let flipCardViewTitle = "Flip Card"
    
    struct Symbol {
        static let waves = "dot.radiowaves.left.and.right"
        static let rotation = "goforward"
        static let card = "creditcard"
        static let ant = "ant"
        static let tortoise = "tortoise"
    }
    
    struct ColorPalette {
        static let item = "ItemColor"
        static let background = "BackgroundColor"
        struct Gold {
            static let first = Color(UIColor(red: 0.98, green: 0.95, blue: 0.58, alpha: 1.00))
            static let second = Color(UIColor(red: 0.88, green: 0.67, blue: 0.24, alpha: 1.00))
            static let third = Color(UIColor(red: 0.97, green: 0.94, blue: 0.54, alpha: 1.00))
            static let fourth = Color(UIColor(red: 0.72, green: 0.54, blue: 0.27, alpha: 1.00))
        }
        struct LinearGrad {
            static let blueGreen = LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
            static let metallicPlatinum = LinearGradient(gradient: Gradient(colors: [.gray, .white, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
            static let metallicGold = LinearGradient(gradient: Gradient(colors: [Gold.first, Gold.second, Gold.third, Gold.fourth]), startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
    
}
