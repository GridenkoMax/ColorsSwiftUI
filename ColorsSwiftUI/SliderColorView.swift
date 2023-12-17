//
//  SliderColorView.swift
//  ColorsSwiftUI
//
//  Created by Maxim Gridenko on 15.12.2023.
//

import SwiftUI

struct SliderColorView: View {
    var colorLabel: Color
    @Binding var value: Double
    @Binding var textValue: String
    @State private var showAlert = false
    
    
    var body: some View {
        HStack{
            Text("\(Int(value))")
                .frame(width: 35)
                .bold()
                .padding()
            
            Slider(value: $value, in: 0...255, step: 1)
                .onChange(of: value) {
                    textValue = "\(Int(value))"
                }
            
            TextField("0", text: $textValue)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .padding(15)
                .onChange(of: textValue) {
                    if let intValue = Int($0), (0...255).contains(intValue) {
                        value = Double(intValue)
                    } else {
                        value = Double(0)
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Value"),
                          message: Text("Value should be between 0 and 255"),
                          dismissButton: .default(Text("Ok"))
                    )
                }
        }
    }
}
                      

//#Preview {
//    SliderColorView()
//
//    }
