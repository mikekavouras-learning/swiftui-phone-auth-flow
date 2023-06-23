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
                .buttonStyle(.borderedProminent)
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
    }
}

#Preview {
    VStack {
        GetStartedButton(text: "Get started", action: {})
            .frame(minWidth: 0, maxWidth: .infinity)
    }.padding()
}
