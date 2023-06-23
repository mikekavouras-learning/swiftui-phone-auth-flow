//
//  ModalView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/20/23.
//

import SwiftUI

struct AuthView: View {
    @Environment(\.dismiss) var dismiss
    @State private var phoneNumber: String = ""
    @State private var showCodeVerification: Bool = false
    
    var onLogin: (() -> Void)?
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 26))
                        .padding()
                })
                
                VStack {
                    PhoneViewContext(
                        phoneNumber: $phoneNumber,
                        showCodeView: $showCodeVerification
                    )
                }
            }
            .navigationDestination(isPresented: $showCodeVerification, destination: {
                VerifyCodeView(
                    dismiss: dismiss,
                    onLogin: onLogin,
                    phoneNumber: $phoneNumber
                )
            })
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    AuthView()
}
