//
//  ContentView.swift
//  ColorSchemeGenerator
//
//  Created by Yashavika Singh on 27.05.24.
//

import SwiftUI

struct ContentView: View {
    private let pasteboard = UIPasteboard.general
    @StateObject private var array = Scheme()
    var body: some View {
        VStack {
            Text("Color Scheme Generator").font(.custom("Georgia", size: 40))
            ForEach(0..<5){ result in
            box(particularColor: array.colorPalette[result])
            }
            Button (action:{
                shuffle(Array: array)
            } )   {
                        Text("Generate").font(.title3)
               
                    }
                .padding()
            }
            .padding()
    }
    
        func box(particularColor: Color) -> some View
        {
            

            ZStack
            {
                RoundedRectangle(cornerRadius: 25.0)
                    .padding(5)
                    .foregroundStyle(Color(particularColor))
                    .onTapGesture(perform: {
                        pasteboard.string = particularColor.hex()
                    })

                Text(particularColor.hex()).font(.footnote).foregroundStyle(particularColor.brightness() > 0.5 ? .black : .white)
            }
        }
    
}

    
#Preview {
    ContentView()
}

