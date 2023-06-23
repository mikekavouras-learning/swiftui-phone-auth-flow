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
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack {
            CountryCodePicker(selection: $selection)
                .frame(height: 50)
                .tint(.secondary)
            
            Divider()
            
            TextField("Phone number", text: $phoneNumber)
                .textFieldStyle(.plain)
                .padding()
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($isFocused)
        }
        .padding()
        .onAppear {
            isFocused = true
        }
    }
}

struct CountryCodePicker: View {
    @Binding var selection: Int
    
    var body: some View {
        Picker("Select a thing", selection: $selection) {
            Text("United States (+1)").tag(0)
            Text("Belgium (+32)").tag(1)
            Text("Brazil (+55)").tag(2)
            Text("Denmark (+45)").tag(3)
            Text("Guinea (+224)").tag(4)
            Text("Japan (+81)").tag(5)
        }
    }
}

#Preview {
    ZStack {
        PhoneView(phoneNumber: .constant(""))
    }.ignoresSafeArea()
}
