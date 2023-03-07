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

struct BigNumberText: View {
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

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.caption)
            .kerning(1.5)
    }
}

struct RoundRectText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius).strokeBorder(Color("ButtonStrokeColor"), lineWidth:Constants.General.strokeWidth)
            )
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(12)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(value: 42)
            SliderText(text: "123")
            LabelText(text: "Label")
            RoundRectText(text: "12")
            BodyText(text: "Body text")
            ButtonText(text: "Button text")
        }.padding()
        
    }
}
