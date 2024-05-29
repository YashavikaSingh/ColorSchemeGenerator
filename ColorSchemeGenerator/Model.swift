//
//  Model.swift
//  ColorSchemeGenerator
//
//  Created by Yashavika Singh on 27.05.24.
//

import SwiftData

import SwiftUI


final class Scheme: ObservableObject {
    
    @Published var colorPalette: [Color]

    init(colorPalette: [Color] = [Color.pink, Color.yellow, Color.indigo, Color.mint, Color.orange]) {
        self.colorPalette = colorPalette
    }
}
