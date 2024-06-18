//
//  Model.swift
//  ColorSchemeGenerator
//
//  Created by Yashavika Singh on 27.05.24.
//

import SwiftData

import SwiftUI

@Observable
 class Scheme {
    
     var colorPalette: [Color]
     var lockedArray: [Bool]

    init(colorPalette: [Color] = [Color.pink, Color.yellow, Color.indigo, Color.mint, Color.orange], lockedArray: [Bool] = [false, false, false, false, false]) {
        self.colorPalette = colorPalette
        self.lockedArray = lockedArray
    }
}
