//
//  OTPTextField.swift
//  LoginFlow1
//
//  Created by Grady Woodruff on 6/23/23.
//
//
import SwiftUI

struct OTPTextField: View {
    @Binding var code: String
    @FocusState private var isKeyboardShowing: Bool

    var body: some View {
        VStack{
            HStack(spacing: 0) {
                ForEach(0..<6,id: \.self){index in
                    OTPTextBox(index)
                }
            }
            .background(content: {
                TextField("", text: $code.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            })
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
            .padding(.bottom,20)
            .padding(.top,10)
        }
        .padding(.all)
        .frame(maxHeight: .infinity,alignment: .top)
    }
    
    // MARK: OTP Text Box
    @ViewBuilder
    func OTPTextBox(_ index: Int)->some View{
        ZStack{
            if code.count > index{
                let startIndex = code.startIndex
                let charIndex = code.index(startIndex, offsetBy: index)
                let charToString = String(code[charIndex])
                Text(charToString)
            }else{
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            let status = (isKeyboardShowing && code.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? Color.primary : Color.gray,lineWidth: status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: isKeyboardShowing)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: View Extensions
extension View{
    func disableWithOpacity(_ condition: Bool)->some View{
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}

// MARK: Binding <String> Extension
extension Binding where Value == String{
    func limit(_ length: Int)->Self{
        if self.wrappedValue.count > length{
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}


//#Preview {
//    @State var dummyCode: String = ""
//    OTPTextField(code: $dummyCode)
//}
