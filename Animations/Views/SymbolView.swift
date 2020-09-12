//
//  AntView.swift
//  Animations
//
//  Created by Fillipi Paiva Suszek on 11/09/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct SymbolView: View {
    var symbol: String?
    
    var body: some View {
        Image(systemName: symbol ?? "ant")
            .font(.system(size: 50, weight: .medium))
            .frame(width: 50, height: 50)
    }
}

struct AntView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: "capslock")
    }
}
