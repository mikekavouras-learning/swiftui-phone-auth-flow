//
//  LayoutView.swift
//  LoginFlow1
//
//  Created by Mike Kavouras on 6/22/23.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            LinearGradient(colors: [.yellow, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Image(systemName: "xmark.circle")
                .font(.system(size: 50))
                .padding(.trailing, 40)
            
            VStack {
                Button(action: {}) {
                    Text("Button")
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}

#Preview {
    LayoutView()
}
