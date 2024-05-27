//
//  ContentView.swift
//  ColorSchemeGenerator
//
//  Created by Yashavika Singh on 27.05.24.
//

import SwiftUI

struct ContentView: View {
    var array = Scheme()
    var body: some View {
        VStack {
            
            Text("Color Scheme Generator").font(.custom("Georgia", size: 40))
           
            ForEach(0..<5) { result in
                box(particularColor: array.colorPalette[result])                        }
            
            Button {
                onTapGesture {
                    
                }
            } label: {
                Text("Generate").font(.title3)
            }
            .padding()

        }
        .padding()
    }
    
    
    private func box(particularColor: Color) -> some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundStyle(particularColor)
                .frame(width: 300, height: 80)
                .padding(5)
            
                .onTapGesture(perform: {
                    //copy hex value
                })
        }
      
    }
}





#Preview {
    ContentView()
}
