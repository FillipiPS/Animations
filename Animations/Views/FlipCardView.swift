//
//  FlipCardView.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 14/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct FlipCardView: View {
    @State private var flipped = false
    @State private var animate3d = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text("Flip Card")
                .font(.largeTitle)
            Spacer()
            ZStack {
                if colorScheme != .dark {
                    SymbolView(symbol: "ant")
                        .foregroundColor(.white)
                        .opacity(flipped ? 0.0 : 1.0)
                    
                    SymbolView(symbol: "tortoise")
                        .foregroundColor(.white)
                        .opacity(flipped ? 1.0 : 0.0)
                } else {
                    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(SymbolView(symbol: "ant"))
                    .opacity(flipped ? 0.0 : 1.0)
                    
                    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(SymbolView(symbol: "tortoise"))
                    .opacity(flipped ? 1.0 : 0.0)
                }
            }
            .frame(width: 350, height: 250)
            .background((colorScheme != .dark) ? LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(30)
            .modifier(FlipEffect(flipped: $flipped, axis: (x: 0, y: 1), angle: animate3d ? 180 : 0))
            .onTapGesture {
                withAnimation(Animation.linear(duration: 0.6)) {
                    self.animate3d.toggle()
                }
            }
            Spacer()
        }.background(Color("BackgroundColor"))
    }
}

struct FlipEffect: GeometryEffect {
    @Binding var flipped: Bool
    let axis: (x: CGFloat, y: CGFloat)
    var angle: Double
    
    var animatableData: Double {
        get {
            angle
        }
        set {
            angle = newValue
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.flipped = self.angle >= 90 && self.angle < 270
        }
        let tweakAngle = flipped ? -180 + angle : angle
        let a = CGFloat(Angle(degrees: tweakAngle).radians)
        
        var transform3d = CATransform3DIdentity
        transform3d.m34 = -1/max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width / 2, -size.height / 2, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2, y: size.height/2))
        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
}

struct FlipCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlipCardView()
    }
}
