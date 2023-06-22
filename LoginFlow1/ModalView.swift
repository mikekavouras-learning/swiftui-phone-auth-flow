//
//  ModalView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/20/23.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    @State private var phoneNumber: String = ""
    @State private var showCodeView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                LinearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 26))
                        .padding()
                        .foregroundColor(Color(UIColor.systemBackground))
                })
                VStack {
                    Spacer()
                    PhoneView(phoneNumber: $phoneNumber)
                    Spacer()
                    Group {
                        Button(action: {
                            showCodeView = true
                        }, label: {
                            Text("Login")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        })
                        .buttonStyle(GetStartedButtonStyle())
                    }.padding()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            .navigationDestination(isPresented: $showCodeView, destination: {
                VerifyCodeView(phoneNumber: $phoneNumber)
                    .toolbarRole(.editor)
            })
        }
        .tint(.primary)
        .interactiveDismissDisabled()
    }
}

#Preview {
    ModalView()
}
