//
//  ContentView.swift
//  ColorsSwiftUI
//
//  Created by Maxim Gridenko on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redTextFieldValue: String = "\(Int(Double.random(in: 0...255)))"
    @State private var greenTextFieldValue: String = "\(Int(Double.random(in: 0...255)))"
    @State private var blueTextFieldValue: String = "\(Int(Double.random(in: 0...255)))"
    
    @FocusState var isInputActive: Bool
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                RectangleView(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
                .padding()
                
                SliderColorView(colorLabel: .red, value: $redSliderValue, textValue: $redTextFieldValue).accentColor(.red)
                
                SliderColorView(colorLabel: .green, value: $greenSliderValue, textValue: $greenTextFieldValue).accentColor(.green)
                
                SliderColorView(colorLabel: .blue, value: $blueSliderValue, textValue: $blueTextFieldValue).accentColor(.blue)
                
                Spacer()
            }
            .padding()
        }
        .onAppear{
            redSliderValue = Double(redTextFieldValue) ?? 0
            greenSliderValue = Double(greenTextFieldValue) ?? 0
            blueSliderValue = Double(blueTextFieldValue) ?? 0
            
        }
        .keyboardType(.numberPad)
        .focused($isInputActive)
        .keyboardType(.numberPad)
        .toolbar{
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false

                }
            }
        }
        
    }
    
}


#Preview {
    
    ContentView()
    
}
