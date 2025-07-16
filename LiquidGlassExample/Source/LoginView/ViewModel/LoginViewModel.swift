//
//  LoginViewModel.swift
//  LiquidGlassExample
//
//  Created by Muhammad  Farhan Akram on 16/07/2025.
//


import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var email: String = "" {
        didSet { validateForm() }
    }
    @Published var password: String = "" {
        didSet { validateForm() }
    }
    @Published var isFormValid: Bool = false

    private func validateForm() {
        isFormValid = !email.isEmpty && !password.isEmpty
    }

    func login() {
        guard isFormValid else { return }
        print("Logging in with: \(email)")
        // Add your login logic here
    }

    func forgotPassword() {
        print("Forgot Password triggered")
        // Forgot password handling here
    }
}
