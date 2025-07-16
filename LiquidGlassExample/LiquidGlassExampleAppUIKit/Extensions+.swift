//
//  Extensions+.swift
//  LiquidGlassExample
//
//  Created by Muhammad  Farhan Akram on 16/07/2025.
//


import Foundation
import SwiftUI

extension View {
    func keyboardToolbarButton(title: String, color: Color, action: @escaping () -> Void) -> some View {
        self.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(title) {
                    action()
                }
                .foregroundColor(color)
            }
        }
    }
}
