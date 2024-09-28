//
//  TappableText.swift
//  Training
//  
//  Created by shsw228 on 2024/09/25
//

import SwiftUI
import HighlightSwift
struct TappableText: View {
    @State var width = 300.0
    @State var maxWidth = 300.0
    @State var isBorderActive = true


    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                Section("Variables") {
                    LabeledContent("Width",value: $width.wrappedValue, format: .number)
                    Slider(value: $width, in: 0...maxWidth)
                        .padding()
                    Toggle(isOn: $isBorderActive) {
                        Text("Border")
                    }
                }
                .padding(.horizontal)

                Section("Values") {
                    VStack(spacing: 10) {
                        HStack {
                            Text("This is")
                            Text("[Tappable Link](https://apple.com)")
                        }
                        HStack {
                            Text("If long text comes here -> ")
                            Text("[Tappable Link](https://apple.com)")

                        }
                    }
                    .frame(width: $width.wrappedValue)
                    .border(isBorderActive ? .red : .clear)
                    .multilineTextAlignment(.center)
                    CodeText("""
                    HStack {
                            Text("This is")
                            Text("[Tappable Link](https://apple.com)")
                    }
                    """)

                    .codeTextStyle(.card)
                    .highlightLanguage(.swift)
                    .font(.system(size: 12))



                    VStack(spacing: 10) {
                        Text("This is[Tappable Link](https://apple.com)")
                        Text("If long text comes here -> [Tappable Link](https://apple.com)")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: $width.wrappedValue)
                    .border(isBorderActive ? .red : .clear)
                    .multilineTextAlignment(.center)
                    CodeText("""
                        Text("This is[Tappable Link](https://apple.com)")
                    """)

                    .codeTextStyle(.card)
                    .highlightLanguage(.swift)
                    .font(.system(size: 12))


                }


                .frame(maxWidth: .infinity)
                .border(isBorderActive ? .green : .clear)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .overlay(content: {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: proxy.size)
                }
            })
            .onPreferenceChange(SizePreferenceKey.self){ value in
                maxWidth = value.width
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var width = 300.0
    @Previewable @State var maxWidth = 300.0

    TappableText(width: width, maxWidth: maxWidth)
        .environment(\.locale, Locale(identifier: "ja-JP"))
}
