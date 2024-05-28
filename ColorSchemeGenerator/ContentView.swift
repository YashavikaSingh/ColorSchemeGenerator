//
//  ContentView.swift
//  ColorSchemeGenerator
//
//  Created by Yashavika Singh on 27.05.24.
//

import SwiftUI

struct ContentView: View {
    var array = Scheme()
    private let pasteboard = UIPasteboard.general
    var body: some View {
        VStack {
            
            Text("Color Scheme Generator").font(.custom("Georgia", size: 40))
           
            ForEach(0..<5) { result in
                box(particularColor: array.colorPalette[result])                        }
            
            Button {
                onTapGesture {
//                    copyToClipboard()
                }
            } label: {
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
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .padding(5)
                .foregroundStyle(Color(particularColor))
            
                .onTapGesture(perform: {
                    pasteboard.string = particularColor.hex()
                    let alertbox: some View = generateCopiedBox(color :particularColor)
                })
            
            Text(particularColor.hex()).font(.footnote)
        }
        
      
    }
    
    
    func generateCopiedBox( color : Color ) -> some View{
        ZStack{
            Rectangle().frame(width: 50, height: 50)
            Text("Copied color \(color) to clipboard")
        }
       
        
    }
    
    
    
}





#Preview {
    ContentView()
}
