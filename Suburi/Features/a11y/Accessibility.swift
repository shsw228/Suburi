//
//  Accessibility.swift
//  Suburi
//
//  Created by shsw228 on 2024/11/30
//
import SwiftUI

struct AccessibilityView: View {
    @State private var isLike = false
    @State private var isAccessibilityActivated = UIAccessibility.isVoiceOverRunning
    var body: some View {
            Form {
                Toggle("UIAccessibilityIsVoiceOverRunning", isOn: $isAccessibilityActivated)
                        .allowsHitTesting(false)

            }
        Form {
            Section{
                Text(verbatim: "Non accesible")
                Text(verbatim: "Many")
                Text(verbatim: "Text")
                Text(verbatim: "makes")
                Text(verbatim: "some issue")
                Button {
                    isLike.toggle()
                } label: {
                    Image(systemName:isLike ? "heart.fill":"heart")
                }
            }
        }
        .padding()
        .onReceive(NotificationCenter.default.publisher(for: UIAccessibility.voiceOverStatusDidChangeNotification)) { _ in
            isAccessibilityActivated = UIAccessibility.isVoiceOverRunning
        }
    }
}

