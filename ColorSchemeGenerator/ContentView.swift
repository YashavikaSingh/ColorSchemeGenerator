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
    @State private var showingAlert = false
    @State private var lastCopiedHex: String = ""
    @State private var showCopiedNotification = false
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
        .overlay(
            copiedNotification()
                .opacity(showCopiedNotification ? 1 : 0)
                .animation(.easeInOut(duration: 0.3), value: showCopiedNotification)
        )
        
       
           
    }
    
    
    func copiedNotification() -> some View {
            VStack {
                Spacer()
                Text("Hex value \(lastCopiedHex) copied to clipboard")
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom, 50)
            }
        }
    
        func box(particularColor: Color) -> some View
        {
            let textColor: Color = particularColor.brightness() > 0.5 ? .black : .white


            return ZStack
            {
                RoundedRectangle(cornerRadius: 25.0)
                    .padding(5)
                    .foregroundStyle(Color(particularColor))
                    .onTapGesture(perform: {
                        pasteboard.string = particularColor.hex()
                        lastCopiedHex = particularColor.hex()
                        showCopiedNotification = true
                 DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                     showCopiedNotification = false
                      }
                    })
                  

                Text(particularColor.hex()).font(.footnote).foregroundStyle(textColor)

            }
            
            
            .onTapGesture{
                pasteboard.string = particularColor.hex()
            }
                
        }
    
}

    
#Preview {
    ContentView()
}

