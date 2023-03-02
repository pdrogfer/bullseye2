//
//  TextViews.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 02.03.23.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.title3)
            .kerning(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
    }
}

struct TargetValueText: View {
    var value: Int
    var body: some View {
        Text(String(value))
            .foregroundColor(Color("TextColor"))
            .font(.largeTitle)
            .kerning(-1.0)
            .fontWeight(.black)
            .bold()
    }
}

struct SliderText: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.bold)
            .font(.body)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            TargetValueText(value: 42)
            SliderText(text: "123")
        }
        
    }
}
