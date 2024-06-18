
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
    @State private var indicesToBeShuffled = [0, 1, 2, 3, 4]
    @State private var showCopiedNotification = false
    @State private var savedColorSchemes: [Scheme] = []

    var body: some View {
        VStack {
            NavigationStack{
                Text("Color Scheme Generator").font(.custom("Georgia", size: 40))
                ForEach(0..<5){ result in
                    box(particularColor: array.colorPalette[result])
                }
                
                HStack
                {
                    Button (action:{
                        shuffle(Array: array)
                    } )   {
                        Text("Generate").font(.title3)
                        
                    }.padding()
                    
                    Spacer()
                    Button(action: {
                        ColorSchemeStorage.shared.saveColorScheme(array)
                        savedColorSchemes = ColorSchemeStorage.shared.allSchemes                    }) {
                        Text("Save").font(.title3)
                        }.padding()

                    
                    Spacer()
                    NavigationLink(destination: SavedColorsView(savedColorSchemes: $savedColorSchemes)) {
                        Text("View saved colors")
                    }
                    .font(.title3)
                    .padding()
                    
                    
                }
                
            }
            
            .overlay(
                copiedNotification()
                    .opacity(showCopiedNotification ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: showCopiedNotification)
            )
            
            .onAppear {
                       savedColorSchemes = ColorSchemeStorage.shared.allSchemes
                   }
            
            
        }
           
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
            let index = array.colorPalette.firstIndex(of: particularColor)
            return HStack{
                ZStack
                {
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                        .frame(width: 300, alignment: .leading)
                        
                        .foregroundStyle(Color(particularColor))
                        .onTapGesture(perform: {
                            pasteboard.string = particularColor.hex()
                            lastCopiedHex = particularColor.hex()
                            showCopiedNotification = true
                     DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                         showCopiedNotification = false
                          }
                        })
                    Text(particularColor.hex()).font(.footnote).foregroundStyle(textColor)
                }

                .onTapGesture{
                    pasteboard.string = particularColor.hex()
                }
                
               
                Image(systemName: array.lockedArray[index ?? 0] ? "lock" : "lock.open")
                    .onTapGesture{
                        array.lockedArray[index ?? 0].toggle()
                    }.frame(width: 25, height: 25)
            }
         
        }
}




    
#Preview {
    ContentView()
}

