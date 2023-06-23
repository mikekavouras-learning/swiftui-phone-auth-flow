//
//  ContentView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/20/23.
//

import SwiftUI

struct BaseView: View {
    @State private var isPresented: Bool = true
    @State private var animationDisabled: Bool = true
    
    var body: some View {
        AppView()
            .fullScreenCover(isPresented: $isPresented, content: {
                // Show the intro view as a full screen modal
                // over AppView with no animation. Once the user
                // authenticates we can dismiss this modal with
                // animation for a nice effect.
                IntroView {
                    animationDisabled.toggle()
                    isPresented.toggle()
                }
            })
            .transaction { t in
                t.disablesAnimations = animationDisabled
            }
    }
}

#Preview {
    BaseView()
}
