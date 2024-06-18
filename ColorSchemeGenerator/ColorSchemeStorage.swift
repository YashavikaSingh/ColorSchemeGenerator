import Foundation

class ColorSchemeStorage {
    static let shared = ColorSchemeStorage()
    private let userDefaultsKey = "savedColorSchemes"

    private init() {}

    func saveColorScheme(_ scheme: Scheme) {
        var schemes = loadColorSchemes()
        schemes.append(scheme)
        if let encoded = try? JSONEncoder().encode(schemes) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    func loadColorSchemes() -> [Scheme] {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([Scheme].self, from: savedData) {
            return decoded
        }
        return []
    }
    
    var allSchemes: [Scheme] {
        return loadColorSchemes()
    }
    
    func clearSavedColorSchemes() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
