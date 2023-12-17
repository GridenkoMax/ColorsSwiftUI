//
//  RectangleView.swift
//  ColorsSwiftUI
//
//  Created by Maxim Gridenko on 15.12.2023.
//

import SwiftUI

struct RectangleView: View {
    
    var red: Double
    var green: Double
    var blue: Double
    
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 100)
            .foregroundStyle(Color(red: red, green: green, blue: blue))
            .overlay(
                RoundedRectangle(
                    cornerRadius: 25).stroke(Color.black , lineWidth: 10)
            )
            .cornerRadius(25)
        
    }
}

//#Preview {
//    RectangleView()
//}

