import Foundation
import SwiftUI

extension UIColor {
    
    static var random: UIColor {
        return .init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
    
    
func hex() -> String {
    guard let components = self.cgColor.components else {
        return ""
    }
    
    let numberOfComponents = self.cgColor.numberOfComponents
    
    if numberOfComponents == 4 {
        let red =  lroundf(Float(components[0] * 255))
        let green = lroundf(Float(components[1] * 255))
        let blue = lroundf(Float(components[2] * 255))
        
        return String(format: "#%02lX%02lX%02lX", red, green, blue)
    } else if numberOfComponents == 2 {
        let gray = lroundf(Float(components[0] * 255))
        
        return String(format: "#%02lX%02lX%02lX", gray, gray, gray)
    } else {
        return ""
    }
}
}

extension Color {
    init(uiColor: UIColor) {
        self.init(uiColor.resolvedColor(with: .current))
    
    }
    
    init(hex: String) {
           let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
           var int = UInt64()
           Scanner(string: hex).scanHexInt64(&int)
           let a, r, g, b: UInt64
           switch hex.count {
           case 3: // RGB (12-bit)
               (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
           case 6: // RGB (24-bit)
               (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
           case 8: // ARGB (32-bit)
               (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
           default:
               (a, r, g, b) = (255, 0, 0, 0)
           }
           self.init(
               .sRGB,
               red: Double(r) / 255,
               green: Double(g) / 255,
               blue: Double(b) / 255,
               opacity: Double(a) / 255
           )
       }
    
    func brightness() -> Double {
          let components = self.cgColor?.components
          let r = components?[0] ?? 0
          let g = components?[1] ?? 0
          let b = components?[2] ?? 0
          return (0.299 * r + 0.587 * g + 0.114 * b)
      }

     var random: Color {
        return .init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
    
    func hex() -> String {
        if self == .clear { return "transparent" }
        return UIColor(self).hex()
    }
}




func shuffle(Array: Scheme) {
    
    for c in 0..<Array.colorPalette.count
    {
        if !Array.lockedArray[c]
        {
            Array.colorPalette[c] = Array.colorPalette[c].random
            
        }
    }
    
    
}
