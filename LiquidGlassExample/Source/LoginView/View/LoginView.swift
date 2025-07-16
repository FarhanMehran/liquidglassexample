//
//  LoginView.swift
//  LiquidGlassExample
//
//  Created by Muhammad  Farhan Akram on 16/07/2025.
//


import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @FocusState private var focusedField: Field?
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()

            VStack(spacing: 20) {
                headerView

                formContainer
                    .glass(
                        radius: 30,
                        color: .white.opacity(0.25),
                        material: .ultraThinMaterial,
                        materialOpacity: 0.5,
                        gradientOpacity: 0.25,
                        gradientStyle: .reverted,
                        strokeWidth: 1.0,
                        shadowColor: .black.opacity(0.3),
                        shadowOpacity: 0.3,
                        shadowRadius: 15,
                        shadowX: 0,
                        shadowY: 8
                    )
                    .padding(.top, 20)
            }
            .padding(.horizontal, 30)
        }
        .keyboardToolbarButton(title: "Done", color: .secondary) {
            self.focusedField = nil
        }
    }

    private var headerView: some View {
        VStack(spacing: 10) {
            AnimatedEmojiView()
            Text("Welcome Back")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(Color.primary)
        }
        .padding(.bottom, 10)
    }

    private var formContainer: some View {
        VStack(spacing: 20) {
            CustomTextField(
                title: "Email",
                text: $viewModel.email,
                isSecure: false
            )
            .focused($focusedField, equals: .email)
            .submitLabel(.next)
            .onSubmit { focusedField = .password }

            CustomTextField(
                title: "Password",
                text: $viewModel.password,
                isSecure: true
            )
            .focused($focusedField, equals: .password)
            .submitLabel(.done)
            .onSubmit {
                focusedField = nil
                viewModel.login()
            }

            Button(action: {
                     // Handle login
                 }) {
                     Text("Login")
                         .frame(maxWidth: .infinity)
                         .padding()
                         .background(viewModel.isFormValid ? Color.purple.opacity(0.9) : Color.gray.opacity(0.3))
                         .cornerRadius(12)
                         .foregroundColor(.white)
                 }
                 .disabled(!viewModel.isFormValid)


            forgotPasswordView

            Divider().background(Color.primary.opacity(0.3))

            Text("Don't have an account? Sign Up")
                .font(.footnote)
                .foregroundColor(Color.secondary)
                .opacity(0.6)
        }
        .padding()
    }

    private var forgotPasswordView: some View {
        HStack {
            Spacer()
            Button("Forgot Password?") {
                viewModel.forgotPassword()
            }
            .font(.footnote)
            .foregroundColor(Color.secondary)
        }
    }

    private var backgroundGradient: LinearGradient {
        let purple = Color.purple
        let blue = Color.blue

        return LinearGradient(
            colors: [
                purple.opacity(colorScheme == .dark ? 0.5 : 0.3),
                blue.opacity(colorScheme == .dark ? 0.5 : 0.3)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}


