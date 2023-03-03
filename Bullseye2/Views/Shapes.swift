//
//  Shapes.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 03.03.23.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20)
                .frame(width: 200, height: 100)
                .background(Color.green)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 100)

            Capsule()
                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 100)

            Ellipse()
                .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 100)

        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
