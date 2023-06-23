//
//  IntroView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/23/23.
//

import SwiftUI

struct IntroView: View {
    // To call after the user has successfully logged in.
    // We can use this to dismiss the intro view and display
    // the actual logged in state
    var loginCallback: () -> Void
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Get started")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44.0)
                })
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isPresented, content: {
                    AuthView(onLogin: loginCallback)
                })
            }
            .padding()
        }
    }
}

#Preview {
    IntroView {}
}
