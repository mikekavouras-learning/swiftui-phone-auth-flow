//
//  VerifyCodeView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/21/23.
//

import SwiftUI
import PhoneNumberKit

struct VerifyCodeView: View {
    var dismiss: DismissAction?
    private let phoneNumberKit = PhoneNumberKit()
    var onLogin: (() -> Void)?
    
    @Binding var phoneNumber: String
    @State private var code: String = ""
    @State private var isAuthenticating: Bool = false
    
    var body: some View {
        let number = try? phoneNumberKit.parse(phoneNumber)
        let formatted = if number != nil {
            phoneNumberKit.format(number!, toType: .international)
        } else {
            phoneNumber
        }
        
        ZStack {
            VStack {
                Spacer()

                VStack {
                    Text("Verification")
                        .font(.system(size: 40, weight: .bold))
                    Text("Enter code sent to \(Text(formatted).fontWeight(.bold))")
                }

                Spacer()

                if !isAuthenticating {
//                    CodeView(code: $code)
                    OTPTextField(code: $code)
                } else {
                    ProgressView()
                }

                Spacer()

                Button {
                    withAnimation {
                        isAuthenticating.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        onLogin?()
                    }
                } label: {
                    Text("Submit")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44.0)
                }
                .buttonStyle(.borderedProminent)
                .disabled(isAuthenticating)
            }.padding()
        }
        .toolbarRole(.editor)
    }
}

//struct CodeView: View {
//    @Binding var code: String
//    @FocusState var isFocused: Bool
//
//    var body: some View {
//        TextField("", text: $code)
//            .keyboardType(.numberPad)
//            .multilineTextAlignment(.center)
//            .font(.system(size: 30))
//            .focused($isFocused)
//            .onAppear {
//                isFocused = true
//            }
//    }
//}

#Preview {
    NavigationStack {
        VerifyCodeView(
            phoneNumber: .constant("7703619464")
        )
    }
}
