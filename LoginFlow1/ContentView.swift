//
//  ContentView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.mint, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                Spacer()
                Button(action: {
                    buttonTapped()
                }, label: {
                    Text("Get started")
                        .frame(minWidth: 0, maxWidth: .infinity)
                })
                .buttonStyle(GetStartedButtonStyle())
                .sheet(isPresented: $isPresented, content: {
                    ModalView()
                })
            }.padding()
        }
    }
    
    private func buttonTapped() {
        isPresented = true
    }
}

#Preview {
    ContentView()
}
