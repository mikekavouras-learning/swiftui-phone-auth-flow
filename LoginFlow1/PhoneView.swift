//
//  PhoneView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/20/23.
//

import SwiftUI

struct PhoneView: View {
    @Binding var phoneNumber: String
    @State var selection: Int = 0
    
    var body: some View {
        VStack {
            PhoneInputView(selection: $selection, phoneNumber: $phoneNumber)
        }.padding()
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.yellow, .blue], startPoint: .top, endPoint: .bottom)
        PhoneView(phoneNumber: .constant(""))
    }.ignoresSafeArea()
}
