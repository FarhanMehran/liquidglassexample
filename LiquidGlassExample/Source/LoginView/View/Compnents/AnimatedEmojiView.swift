//
//  AnimatedEmojiView.swift
//  LiquidGlassExample
//
//  Created by Muhammad  Farhan Akram on 16/07/2025.
//
import SwiftUI

struct AnimatedEmojiView: View {
    @State private var animate = false
    
    var body: some View {
        Text("👋")  // waving hand emoji, you can change this
            .font(.system(size: 60))
            .rotationEffect(.degrees(animate ? 20 : -20), anchor: .bottomLeading)
            .animation(
                .easeInOut(duration: 0.6)
                .repeatForever(autoreverses: true),
                value: animate
            )
            .onAppear {
                animate = true
            }
    }
}
