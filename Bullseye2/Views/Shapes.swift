//
//  Shapes.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 03.03.23.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                // modifier for the global transition 'withAnimation()
                    .transition(.scale)
            }
            
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .frame(width: wideShapes ? 200 : 100, height: 100)
                // individual animation example
                //.animation(.easeInOut, value: wideShapes)
            Capsule()
                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .frame(width: wideShapes ? 200 : 100, height: 100)

            Ellipse()
                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .frame(width: wideShapes ? 200 : 100, height: 100)
            Button("Animate!") {
                // group animation based on a collective parameter
                withAnimation {
                    wideShapes.toggle()
                }
                
            }

        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
