//
//  CustomTextField.swift
//  LiquidGlassExample
//
//  Created by Muhammad  Farhan Akram on 16/07/2025.
//


import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var isSecure: Bool

    @State private var isPasswordVisible: Bool = false

    var body: some View {
        HStack {
            // Left icon
            Image(systemName: iconName)
                .foregroundColor(.gray)

            if isSecure {
                if isPasswordVisible {
                    TextField(title, text: $text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } else {
                    SecureField(title, text: $text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
            } else {
                TextField(title, text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(title.lowercased() == "email" ? .emailAddress : .default)
            }

            if isSecure {
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
        .foregroundColor(Color.primary)
    }

    private var iconName: String {
        if title.lowercased().contains("email") {
            return "envelope"
        } else if title.lowercased().contains("password") {
            return "lock"
        }
        return "person"
    }
}

