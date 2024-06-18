//
//  Model.swift
//  ColorSchemeGenerator
//
//  Created by Yashavika Singh on 27.05.24.
//

import SwiftData

import SwiftUI

@Observable
class Scheme: ObservableObject, Codable, Identifiable {
    var id = UUID()
    
     var colorPalette: [Color]
     var lockedArray: [Bool]

    init(colorPalette: [Color] = [Color.pink, Color.yellow, Color.indigo, Color.mint, Color.orange], lockedArray: [Bool] = [false, false, false, false, false]) {
        self.colorPalette = colorPalette
        self.lockedArray = lockedArray
        
    }
    
    enum CodingKeys: String, CodingKey {
        case colorPalette, lockedArray
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let colorHexStrings = try container.decode([String].self, forKey: .colorPalette)
        self.colorPalette = colorHexStrings.map { Color(hex: $0) } // Decode hex strings into Color objects
        self.lockedArray = try container.decode([Bool].self, forKey: .lockedArray)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let colorHexStrings = colorPalette.map { $0.hex() } // Encode Color objects into hex strings
        try container.encode(colorHexStrings, forKey: .colorPalette)
        try container.encode(lockedArray, forKey: .lockedArray)
    }
}
