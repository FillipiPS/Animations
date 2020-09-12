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
            .resizable()
            .frame(width: 50, height: 70)
            .aspectRatio(contentMode: .fit)
    }
}

struct AntView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: "tortoise")
    }
}
