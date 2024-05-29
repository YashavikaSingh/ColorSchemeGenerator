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
        Array.colorPalette[c] = Array.colorPalette[c].random
        print(Array.colorPalette[c])
    }
    
    
}
