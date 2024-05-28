import Foundation
import SwiftUI

func shuffle() {
    
    
}




extension UIColor {
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
    func hex() -> String {
        if self == .clear { return "transparent" }
        return UIColor(self).hex()
    }
}


extension Color {
    init(uiColor: UIColor) {
        self.init(uiColor.resolvedColor(with: .current))
    }
}

