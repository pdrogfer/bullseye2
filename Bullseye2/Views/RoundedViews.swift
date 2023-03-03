//
//  RoundedViews.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 03.03.23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(Circle().fill(Color("ButtonFilledBackgroundColor")))
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}
