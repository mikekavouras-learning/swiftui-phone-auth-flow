//
//  VerifyCodeView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/21/23.
//

import SwiftUI
import PhoneNumberKit

struct VerifyCodeView: View {
    @Binding var phoneNumber: String
    var dismiss: DismissAction?
    private let phoneNumberKit = PhoneNumberKit()
    var onLogin: (() -> Void)?
    
    var body: some View {
        let number = try? phoneNumberKit.parse(phoneNumber)
        let formatted = if number != nil {
            phoneNumberKit.format(number!, toType: .international)
        } else {
            phoneNumber
        }
        
        ZStack {
            LinearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                VStack {
                    Text("Verification")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.white)
                    Text("Enter code sent to \(Text(formatted).fontWeight(.bold))")
                        .foregroundStyle(.white)
                }
                Spacer()
                CodeView()
                Spacer()
                Button {
                    dismiss?()
                    onLogin?()
                } label: {
                    Text("Submit")
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(GetStartedButtonStyle())
            }.padding()
        }
    }
}

struct CodeView: View {
    @State var text: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        TextField("code", text: $text)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .font(.system(size: 30))
            .focused($isFocused)
            .onAppear {
                isFocused = true
            }
    }
}

#Preview {
    NavigationStack {
        VerifyCodeView(phoneNumber: .constant("7703619464"))
    }
}
