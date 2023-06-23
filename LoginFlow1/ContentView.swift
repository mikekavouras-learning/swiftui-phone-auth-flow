//
//  ContentView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = true
    @State private var animationDisabled: Bool = true
    
    var body: some View {
        AppView()
            .fullScreenCover(isPresented: $isPresented, content: {
                IntroView {
                    animationDisabled.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isPresented.toggle()
                    }
                    
                }
            })
            .transaction { t in
                t.disablesAnimations = animationDisabled
            }
    }
}

struct AppView: View {
    
    var body: some View {
        Text("Welcome to app")
    }
}

struct IntroView: View {
    var loginCallback: () -> Void
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.mint, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                Spacer()
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Get started")
                        .frame(minWidth: 0, maxWidth: .infinity)
                })
                .buttonStyle(GetStartedButtonStyle())
                .sheet(isPresented: $isPresented, content: {
                    ModalView(onLogin: loginCallback)
                })
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
