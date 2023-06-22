//
//  GetStartedButton.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/20/23.
//

import SwiftUI

struct GetStartedButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(text, action: action)
                .buttonStyle(GetStartedButtonStyle())
        }
    }
}

struct GetStartedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .padding()
            .background(Material.thick)
            .foregroundColor(configuration.isPressed ? .secondary : .primary)
            .cornerRadius(10)
            .shadow(radius: configuration.isPressed ? 2.0 : 4.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(Spring(duration: 0.2, bounce: 0.5)), value: configuration.isPressed)
    }
}


#Preview {
    ZStack {
        LinearGradient(colors: [.yellow, .blue], startPoint: .top, endPoint: .bottom)
        GetStartedButton(text: "Get started", action: {})
    }.ignoresSafeArea()
}
