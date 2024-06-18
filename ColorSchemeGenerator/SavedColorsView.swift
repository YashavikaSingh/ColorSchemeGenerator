import SwiftUI

struct SavedColorsView: View {
    @Binding var savedColorSchemes: [Scheme]

    var body: some View {
        NavigationView {
            List(savedColorSchemes) { scheme in
                VStack(alignment: .leading) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                       HStack(spacing: 0) {
                            ForEach(scheme.colorPalette, id: \.self) { color in
                                Rectangle()
                                    .fill(color)
                                    .frame(width: 40, height: 40)
                                    
                            }
                        }
                  
                    }
                    .frame(height: 60)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Saved Color Schemes")
        }
    }
}

//#Preview {
//    SavedColorsView(savedColorSchemes: .constant([])) // Replace with your actual savedColorSchemes binding
//}
