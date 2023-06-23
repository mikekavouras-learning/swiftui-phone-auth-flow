//
//  PhoneViewContext.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/23/23.
//

import SwiftUI

struct PhoneViewContext: View {
    @Binding var phoneNumber: String
    @Binding var showCodeView: Bool
    
    var body: some View {
        Spacer()
        PhoneView(phoneNumber: $phoneNumber)
        Spacer()
        Group {
            Button(action: {
                showCodeView = true
            }, label: {
                Text("Login")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44.0
                    )
            })
            .buttonStyle(.borderedProminent)
        }.padding()
    }
}

#Preview {
    PhoneViewContext(phoneNumber: .constant(""), showCodeView: .constant(false))
}
