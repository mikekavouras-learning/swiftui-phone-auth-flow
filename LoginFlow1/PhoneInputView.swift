//
//  PhoneInputView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/21/23.
//

import SwiftUI

struct PhoneInputView: View {
    @Binding var selection: Int
    @Binding var phoneNumber: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            CountryCodePicker(selection: $selection)
                .frame(height: 50)
                .tint(.primary)
            
            Divider()
            
            TextField("Phone number", text: $phoneNumber)
                .textFieldStyle(.plain)
                .padding()
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($isFocused)
        }
        .background(Material.thick)
        .cornerRadius(6)
        .shadow(radius: 4)
        .padding(16)
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
        LinearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom)
        PhoneInputView(selection: .constant(0), phoneNumber: .constant(""))
    }.ignoresSafeArea()
}
